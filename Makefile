ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
MAKE_DIR = $(ROOT_DIR)/.make

export NAME = lambda-multi-python

AWS_PROFILE = default
AWS_REGION = eu-west-1

TF_VERSION = 1.11.3

init: MAKE_URI = https://raw.githubusercontent.com/applicreation/make
init: MAKE_VERSION = v0
init: MAKE_FILES = aws aws-lambda docker git terraform
init:
	@rm -rf $(MAKE_DIR) && mkdir -p $(MAKE_DIR)
	@for MAKE_FILE in $(MAKE_FILES); do docker run --rm curlimages/curl -sSL $(MAKE_URI)/$(MAKE_VERSION)/src/$${MAKE_FILE}.mk > $(MAKE_DIR)/$${MAKE_FILE}.mk; done

-include $(MAKE_DIR)/*.mk
