#!/bin/bash
printf 'On your ~/.muttrc: set folder = "imaps://localhost:2999"'
autossh -M 19999 -L 2999:imap.gmail.com:993 $S -N
