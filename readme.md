# vagrant-ubuntu-web-dev
用于 web 开发的 ubuntu(18.04) 环境

## 主要配置
- vbox 基础配置
  - 2 core CPU
  - 2G RAM
  - 32G HDD
- ubuntu 初始配置（见:bootstrap.sh）
  - 调整时区和字符集 zh_CN.UTF-8
  - ~调整使用国内 apt 源~
  - python、virtualenvwrapper 环境
  - nginx
- 插件
  - vagrant-share
  - vagrant-vbguest
  - vagrant-disksize

## Usage


### for Mac OS HomeBrew
```
brew cask install virtualbox
brew cask install vagrant
```

```
git clone https://github.com/hectorqiuiscool/vagrant-ubuntu-web-dev.git
cd path_to_vagrant-ubuntu-web-dev
vagrant up
```


## 国内 vagrant box 下载慢解决办法

#### 通过 Makefile 下载配置（推荐）
```
make add_box
```


#### 一步步操作（备选）
```
# 下载 https://app.vagrantup.com/generic/boxes/ubuntu1804 对应的 1.8.52 virtualbox 镜像

wget https://app.vagrantup.com/generic/boxes/ubuntu1804/versions/1.8.52/providers/virtualbox.box -O ubuntu1804_1.8.52.box

vagrant box add generic/ubuntu1804 ubuntu1804_1.8.52.box

cd ~/.vagrant.d/boxes/generic-VAGRANTSLASH-ubuntu1804/
mv 0 1.8.52

# 创建 metadata_url 文件
echo -n "https://app.vagrantup.com/generic/boxes/ubuntu1804" > metadata_url

# 检查 box 列表
vagrant box list
```
