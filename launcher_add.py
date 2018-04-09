import gi
import sys
from gi.repository import Gio
gi.require_version('Gtk', '3.0')


def gsettings_get(schema, path, key):
    if path is None:
        gsettings = Gio.Settings.new(schema)
    else:
        gsettings = Gio.Settings.new_with_path(schema, path)
    return gsettings.get_value(key)


def gsettings_set(schema, path, key, value):
    if path is None:
        gsettings = Gio.Settings.new(schema)
    else:
        gsettings = Gio.Settings.new_with_path(schema, path)
    return gsettings.set_strv(key, value)


current_list = list(gsettings_get('com.canonical.Unity.Launcher', None,
                                  'favorites'))

if sys.argv[2]:
    current_list.insert(int(sys.argv[2]), "application://" + sys.argv[1])
else:
    current_list.append("application://" + sys.argv[1])

gsettings_set('com.canonical.Unity.Launcher', None, 'favorites', current_list)
