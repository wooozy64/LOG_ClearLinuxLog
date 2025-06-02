#!/bin/bash

# 清空特定日志文件
truncate -s 0 /var/log/syslog
truncate -s 0 /var/log/auth.log

# 轮转日志文件
logrotate -f /etc/logrotate.conf

# 清空登录日志
echo > /var/log/btmp
echo > /var/log/wtmp
echo > /var/log/utmp
echo > /var/log/lastlog
echo > /var/log/auth.log
echo > /var/log/secure

# 清理journalctl日志
rm -rf /var/log/journal/*
#journalctl --vacuum-time=2weeks

# 清空history记录
#history -cw
#history -c && history -w
echo > ~/.bash_history
#unset HISTFILE
#export HISTFILE=/dev/null
echo 'clear done.'
