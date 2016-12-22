#!/bin/bash

for i in $(ls -1 /home/morfetico/telegram-bot/plugins/);do echo -e "\n";ls -lh /root/telegram-bot/plugins/${i} /home/morfetico/telegram-bot/plugins/${i};done

