# SPDX-License-Identifier: MIT
# Copyright (C) 2023 The Asahi Linux Contributors

PREFIX ?= /usr/
DATA_DIR ?= $(PREFIX)/share/

all: aliases

aliases: aliases-j274 aliases-j293 aliases-j314 aliases-j316 aliases-j375

aliases-j274:
	make -f $$PWD/Makefile -C firs/j274 graph-j473.json graph-j474.json

aliases-j375:
	make -f $$PWD/Makefile -C firs/j375 graph-j475.json

aliases-j293:
	make -f $$PWD/Makefile -C firs/j293 graph-j493.json

aliases-j314:
	make -f $$PWD/Makefile -C firs/j314 graph-j414.json

aliases-j316:
	make -f $$PWD/Makefile -C firs/j316 graph-j416.json

graph-%.json: graph.json
	sed -E "s/([^/][jJ])$$(basename "$$PWD" | tr -d j)/\1$(patsubst graph-j%.json,%,$@)/g" $< >$@

clean:
	rm -f firs/*/graph-*.json

core:
	install -dDm0755 $(DESTDIR)/$(DATA_DIR)/wireplumber/policy.lua.d/
	install -dDm0755 $(DESTDIR)/$(DATA_DIR)/wireplumber/main.lua.d/
	install -dDm0755 $(DESTDIR)/$(DATA_DIR)/wireplumber/scripts/
	install -dDm0755 $(DESTDIR)/$(DATA_DIR)/wireplumber/wireplumber.conf.d/
	install -dDm0755 $(DESTDIR)/$(DATA_DIR)/pipewire/pipewire.conf.d/
	install -dDm0755 $(DESTDIR)/$(DATA_DIR)/pipewire/pipewire-pulse.conf.d/
	install -pm0644 conf/99-asahi-wp.conf $(DESTDIR)/$(DATA_DIR)/wireplumber/wireplumber.conf.d/99-asahi.conf
	install -pm0644 conf/85-asahi-policy.lua $(DESTDIR)/$(DATA_DIR)/wireplumber/policy.lua.d/85-asahi-policy.lua
	install -pm0644 conf/85-asahi-wireplumber.lua $(DESTDIR)/$(DATA_DIR)/wireplumber/main.lua.d/85-asahi.lua
	install -pm0644 conf/policy-asahi.lua $(DESTDIR)/$(DATA_DIR)/wireplumber/scripts/policy-asahi.lua
	install -pm0644 conf/99-asahi.conf $(DESTDIR)/$(DATA_DIR)/pipewire/pipewire.conf.d/99-asahi.conf
	install -pm0644 conf/99-asahi-pulse.conf $(DESTDIR)/$(DATA_DIR)/pipewire/pipewire-pulse.conf.d/99-asahi.conf
	install -dDm0755 $(DESTDIR)/$(DATA_DIR)/asahi-audio/

j%: core
	install -dDm0755 $(DESTDIR)/$(DATA_DIR)/asahi-audio/$@/
	install -pm0644 -t $(DESTDIR)/$(DATA_DIR)/asahi-audio/$@/ $(wildcard firs/$@/*)


install: aliases core j274 j293 j313 j314 j316 j413 j415 j375

uninstall:
	rm -f $(DESTDIR)/$(DATA_DIR)/wireplumber/policy.lua.d/99-asahi-policy.lua
	rm -rf $(DESTDIR)/$(DATA_DIR)/asahi-audio/
	rm -rf $(DESTDIR)/$(DATA_DIR)/pipewire/pipewire.conf.d/99-asahi.conf
