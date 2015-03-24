#!/bin/bash
printf "On your /etc/ssmtp/ssmtp.conf: mailhub=127.0.0.1:3000"
# autossh -M 20000 -L 3000:smtp.gmail.com:587 $S -N
ssh -L 3000:smtp.gmail.com:587 $S -N
