APP_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(APP_DIR)/../Makefile

lambda_%: export NAME += -$(subst _,-,$(notdir $(CURDIR)))
lambda_%: export DIR = ./$(subst $(APP_DIR),,$(CURDIR))

lambda_%: DOCKER_COMPOSE_FILE = $(APP_DIR)/docker-compose.yaml
