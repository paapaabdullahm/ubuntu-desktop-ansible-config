#!/usr/bin/env python

import os
import argparse
import dbus

bus = dbus.SystemBus()


def get_user_account_path(user):
    account_path = ""
    accounts = bus.get_object('org.freedesktop.Accounts',
                              '/org/freedesktop/Accounts')
    accounts_iface = dbus.Interface(accounts, dbus_interface='org.freedesktop.Accounts')

    if type(user) == str:
        account_path = accounts_iface.FindUserByName(user)
    elif type(user) == int:
        account_path = accounts_iface.FindUserById(dbus.Int64(user))

    return account_path


def get_user_xsession(account_path):
    user = bus.get_object('org.freedesktop.Accounts',
                          account_path)
    return user.Get('org.freedesktop.Accounts.User', 'XSession',
                    dbus_interface='org.freedesktop.DBus.Properties')


def set_user_xsession(account_path, session):
    user = bus.get_object('org.freedesktop.Accounts',
                          account_path)
    user.SetXSession(session,
                     dbus_interface='org.freedesktop.Accounts.User')


def handle_get(args):
    if args.user_name:
        user = args.user_name
    else:
        user = args.user_id

    account_path = get_user_account_path(user)
    get_user_xsession(account_path)


def handle_set(args):
    if args.user_name:
        user = args.user_name
    else:
        user = args.user_id

    account_path = get_user_account_path(user)
    set_user_xsession(account_path, args.session)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Change the .')
    parser.add_argument('--user-id', type=int, default=os.getuid(), help='the user id')
    parser.add_argument('--user-name', type=str, help='the user name')
    subparsers = parser.add_subparsers(help='sub-command help')

    parser_get = subparsers.add_parser('get')
    parser_get.set_defaults(func=handle_get)

    parser_set = subparsers.add_parser('set')
    parser_set.add_argument('session', type=str, help='the session')
    parser_set.set_defaults(func=handle_set)

    args = parser.parse_args()

    args.func(args)
