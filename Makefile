#    __                        __      _
#   / /__________ __   _____  / /___  (_)___  ____ _
#  / __/ ___/ __ `/ | / / _ \/ / __ \/ / __ \/ __ `/
# / /_/ /  / /_/ /| |/ /  __/ / /_/ / / / / / /_/ /
# \__/_/   \__,_/ |___/\___/_/ .___/_/_/ /_/\__, /
#                           /_/            /____/
#
# Copyright (c) Travelping GmbH <info@travelping.com>

ERL  = erl
ERLC = erlc

APPLICATION = tp_json_rpc
SRC_DIR     = $(CURDIR)/src
EBIN_DIR    = $(CURDIR)/ebin
INCLUDE_DIR = $(CURDIR)/include
TEST_DIR     = $(CURDIR)/test
TEST_LOG_DIR = $(CURDIR)/test-log

.PHONY: all clean shell

all:
	$(MAKE) -C c_src
	$(ERL) -pa $(EBIN_DIR) -noinput \
	-eval "case make:all() of up_to_date -> halt(0); error -> halt(1) end."

clean:
	$(MAKE) -C c_src clean
	rm -f $(EBIN_DIR)/*.beam
	rm -fr ${TEST_DIR}/*.beam
	rm -f doc/edoc-info doc/*.html doc/*.css doc/*.png
	rm -fr ${TEST_LOG_DIR}/*

shell: all
	$(ERL) -pa $(EBIN_DIR)
