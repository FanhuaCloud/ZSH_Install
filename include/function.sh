#!/bin/bash

function Coloseselinux() {
  #关闭selinux
  Logprefix;echo ${CMSG}'[Info]关闭Selinux'${CEND}
  [ -s /etc/selinux/config ] && sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0 >/dev/null 2>&1
}

function Settimezone() {
  #设置时区并同步时间
  Logprefix;echo ${CMSG}'[Info]设置服务器时区'${CEND}
  rm -rf /etc/localtime
	ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
  Logprefix;echo ${CMSG}'[Info]同步服务器时间'${CEND}
  ntpdate cn.ntp.org.cn
}

function Logprefix() {
  #输出log
  echo -n ${CGREEN}'CraftYun >> '
}