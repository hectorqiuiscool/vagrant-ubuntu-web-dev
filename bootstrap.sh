#!/usr/bin/env bash

# 自定义变量

# 解决 ubuntu 官方坑爹镜像的  sudo: unable to resolve host xxxxxx 的问题
# 解决办法是把 /etc/hostname 的名字在 /etc/hosts 内加一条配置
echo 127.0.1.1 $(hostname) | sudo tee -a /etc/hosts
echo 127.0.0.1 localhost | sudo tee -a /etc/hosts
echo 127.0.0.1 ubuntu-xenial | sudo tee -a /etc/hosts

# 调整时间为东八区，修正 locale 不完整
timedatectl set-timezone Asia/Shanghai
sudo locale-gen zh_CN.UTF-8

#sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
#sudo cp /mnt/config/etc/apt/sources.list /etc/apt/sources.list

sudo apt-get update

# 安装 python 运行环境
sudo apt-get install -y python-pip python-dev build-essential
sudo apt-get install -y python-pip python3.6 python3.6-dev
sudo pip install virtualenvwrapper

echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
echo "export PROJECT_HOME=$HOME/Devel" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc

# web server
#sudo apt-get install -y nginx 
#sudo apt-get install -y uwsgi

# install git
sudo apt-get -y install git

# disable swap
sudo swapoff -a 
