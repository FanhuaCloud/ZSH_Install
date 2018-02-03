#!/bin/bash

. ./include/color.sh # 设置颜色
. ./include/memory.sh # 增加虚拟内存

#关闭selinux
function Coloseselinux() {
  echo "${CSUCCESS}[INFO]${CMSG}关闭SELINUX${CEND}"
  [ -s /etc/selinux/config ] && sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0 >/dev/null 2>&1
}

#设置时区并同步时间
function Settimezone() {
  echo "${CSUCCESS}[INFO]${CMSG}设置服务器时区${CEND}"
  rm -rf /etc/localtime
  ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
  echo "${CSUCCESS}[INFO]${CMSG}同步服务器时间${CEND}"
  ntpdate cn.ntp.org.cn
}

Coloseselinux
Settimezone