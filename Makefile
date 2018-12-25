VERSION = 0.0.1

GROUP = generic
BOX = ubuntu1804
BOX_VERSION = 1.8.52

BUILD_TIME = $(shell date +%FT%H_%M_%S)

help: ## Print this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help


add_box: download_box # 添加 box 到 vagrant

	vagrant box add $(GROUP)/$(BOX) $(GROUP)-$(BOX)-$(BOX_VERSION).box

	cd ~/.vagrant.d/boxes/$(GROUP)-VAGRANTSLASH-$(BOX)/ && mv 0 1.8.52

	# 创建 metadata_url 文件
	cd ~/.vagrant.d/boxes/$(GROUP)-VAGRANTSLASH-$(BOX)/ && echo -n "https://app.vagrantup.com/$(GROUP)/boxes/$(BOX)" > metadata_url

	# 检查 box 列表
	vagrant box list

download_box:  # 下载 vagrant virtualbox 镜像
	wget https://app.vagrantup.com/$(GROUP)/boxes/$(BOX)/versions/$(BOX_VERSION)/providers/virtualbox.box -O $(GROUP)-$(BOX)-$(BOX_VERSION).box


