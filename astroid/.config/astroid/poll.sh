#!/usr/bin/env bash
# located at ~/.config/astroid/poll.sh

# TODO Add checks for notmuch database and if gmail is setup correctly
# commands:
# notmuch new
# gmi init mail@mail.com

# Exit as soon as one of the commands fail.
set -e

# Fetch new mail.
currentDir=$PWD
cd ~/.mail/account.gmail/
gmi push
gmi pull
cd $currentDir

# Import new mail into the notmuch database.
notmuch new
notifymuch
# https://github.com/astroidmail/astroid/wiki/Processing-mail
