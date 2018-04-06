#!/usr/bin/env bash

# Description: Installs Gnome Shell Extensions
# Requirements: gnome-shell, unzip, wget

# set paths
USER_PATH="$HOME/.local/share/gnome-shell/extensions"
[ -f /etc/debian_version ] && SYSTEM_PATH="/usr/local/share/gnome-shell/extensions" || SYSTEM_PATH="/usr/share/gnome-shell/extensions"
GNOME_SITE="https://extensions.gnome.org"

# get current gnome version - major, minor
TARGET_VERSION="$(DISPLAY=":0" gnome-shell -v | tr -cd "0-9." | cut -d'.' -f1,2)"
CURRENT_VERSION="${TARGET_VERSION}"

# set defaults
INSTALL_MODE="user"
EXTENSION_PATH="${USER_PATH}"
INSTALL_SUDO=""

# iterate params
while test ${#} -gt 0
do
	case $1 in
		-i) ACTION="install"; shift;
		;;
		-r) ACTION="remove"; shift;
		;;
		-u) INSTALL_MODE="user"; shift;
		;;
		-s) INSTALL_MODE="system"; shift;
		;;
		-v) shift; TARGET_VERSION="$1"; shift;
		;;
		--eid) shift; EXTENSION_ID="$1"; shift;
		;;
		*) echo "Unknown parameter $1"; shift;
		;;
	esac
done

[ "${INSTALL_MODE}" = "system" ] && { EXTENSION_PATH="${SYSTEM_PATH}"; INSTALL_SUDO="sudo"; }

# create temp files
TMP_DESC=$(mktemp -t ext-XXXXXXXX.txt) && rm ${TMP_DESC}
TMP_ZIP=$(mktemp -t ext-XXXXXXXX.zip) && rm ${TMP_ZIP}
TMP_VERSION=$(mktemp -t ext-XXXXXXXX.ver) && rm ${TMP_VERSION}

# get extension description
wget --quiet --header='Accept-Encoding:none' -O "${TMP_DESC}" "${GNOME_SITE}/extension-info/?pk=${EXTENSION_ID}"

# store needed extension details
EXTENSION_NAME=$(sed 's/^.*name[\": ]*\([^\"]*\).*$/\1/' "${TMP_DESC}")
EXTENSION_DESC=$(sed 's/^.*description[\": ]*\([^\"]*\).*$/\1/' "${TMP_DESC}")
EXTENSION_UUID=$(sed 's/^.*uuid[\": ]*\([^\"]*\).*$/\1/' "${TMP_DESC}")

# if no description
if [ ! -s "${TMP_DESC}" ]
then
	echo "[Error] Extension with ID ${EXTENSION_ID} is not available from Gnome Shell Extension site."

elif [ "${ACTION}" = "install" ];
then
	# extract all available versions
	sed "s/\([0-9]*\.[0-9]*[0-9\.]*\)/\n\1/g" "${TMP_DESC}" | grep "pk" | grep "version" | sed "s/^\([0-9\.]*\).*$/\1/" | sort -V > "${TMP_VERSION}"

	# look for latest or current version
	[ "${TARGET_VERSION}" = "latest" ] && VERSION_AVAILABLE=$(cat "${TMP_VERSION}" | tail -n 1) || VERSION_AVAILABLE=$(grep "^${TARGET_VERSION}$" "${TMP_VERSION}")

	# if no candidate version found, get the next one after current version
	if [ "${VERSION_AVAILABLE}" = "" ]
	then
		# create a version list including current version
		cp "${TMP_VERSION}" "${TMP_DESC}"
		echo "${TARGET_VERSION}" >> "${TMP_DESC}"

		# sort by version and get next version available after current version
		VERSION_AVAILABLE=$(cat "${TMP_DESC}" | sort -V | sed "1,/${TARGET_VERSION}/d" | head -n 1)
	fi

	# if candidate version has been found, let's install
	if [ "${VERSION_AVAILABLE}" != "" ]
	then
		# get extension description
		wget --quiet --header='Accept-Encoding:none' -O "${TMP_DESC}" "${GNOME_SITE}/extension-info/?pk=${EXTENSION_ID}&shell_version=${VERSION_AVAILABLE}"

		# get extension download URL
		EXTENSION_URL=$(sed 's/^.*download_url[\": ]*\([^\"]*\).*$/\1/' "${TMP_DESC}")

		# download extension archive
		wget --quiet --header='Accept-Encoding:none' -O "${TMP_ZIP}" "${GNOME_SITE}${EXTENSION_URL}"

		# unzip extension to installation folder
		${INSTALL_SUDO} mkdir -p ${EXTENSION_PATH}/${EXTENSION_UUID}
		${INSTALL_SUDO} unzip -oq "${TMP_ZIP}" -d ${EXTENSION_PATH}/${EXTENSION_UUID}
		${INSTALL_SUDO} chmod +r ${EXTENSION_PATH}/${EXTENSION_UUID}/*

		# list enabled extensions (remove @as in case of no extension enabled)
		EXTENSION_LIST=$(gsettings get org.gnome.shell enabled-extensions | sed 's/^@as //' | tr -d '[]')
		[ "${EXTENSION_LIST}" != "" ] && EXTENSION_LIST="${EXTENSION_LIST},"

		# if extension not already enabled, declare it
		EXTENSION_ENABLED=$(echo ${EXTENSION_LIST} | grep ${EXTENSION_UUID})
		[ "$EXTENSION_ENABLED" = "" ] && gsettings set org.gnome.shell enabled-extensions "[${EXTENSION_LIST}'${EXTENSION_UUID}']"

		# success message
		echo "[success] Extension ${EXTENSION_NAME} version ${VERSION_AVAILABLE} has been installed in ${INSTALL_MODE} mode (Id ${EXTENSION_ID}, Uuid ${EXTENSION_UUID})"
		echo "Restart Gnome Shell ${CURRENT_VERSION} to take effect."
	else
		# generate list of available versions
		LST_VERSION=$(cat ${TMP_VERSION} | sort -V | xargs)
		echo "[Error] Gnome Shell version is ${CURRENT_VERSION}, no candidate extension ${EXTENSION_NAME} found"
		echo "Available versions are ${LST_VERSION}"
	fi

elif [ "${ACTION}" = "remove" ]
then
	# if extension is installed, then remove it
	if [ -d "${EXTENSION_PATH}/${EXTENSION_UUID}" ]
	then
		${INSTALL_SUDO} rm -f -r "${EXTENSION_PATH}/${EXTENSION_UUID}"
		echo "[Success] Extension ${EXTENSION_NAME} has been removed in ${INSTALL_MODE} mode (Id ${EXTENSION_ID}, Uuid ${EXTENSION_UUID})"
		echo "Restart Gnome Shell ${CURRENT_VERSION} to take effect."
	else
		echo "[Error] Extension ${EXTENSION_NAME} has not been found in ${INSTALL_MODE} mode (Id ${EXTENSION_ID}, Uuid ${EXTENSION_UUID})"
	fi
fi

# finally, cleanup system by removing temp files
rm -f ${TMP_DESC} ${TMP_ZIP} ${TMP_VERSION}
