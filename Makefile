# import config.
# You can change the default config with `make cnf="config_special.env" build`
#cnf ?= config.env
#include $(cnf)
#export $(shell sed 's/=.*//' $(cnf))
#
## import deploy config
## You can change the default deploy config with `make cnf="deploy_special.env" release`
#dpl ?= deploy.env
#include $(dpl)
#export $(shell sed 's/=.*//' $(dpl))

# grep the version from the mix file
#VERSION=$(shell ./version.sh)

PWD=$(shell pwd)

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


run-local: ## Run project using docker and volume in project files
	docker run --rm -i -t -p 1880:1880 -v $(PWD)/:/data --name nodered nodered/node-red
