#!/bin/bash
kill -9 `ps|grep ssh-agent|awk '{print $1}'`
ssh-agent.exe -s > ~/.ssh/ssh-agent.sh
chmod u+x ~/.ssh/ssh-agent.sh
source ~/.ssh/ssh-agent.sh
ssh-add
