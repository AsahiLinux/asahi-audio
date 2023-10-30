# SPDX-License-Identifier: MIT
# Copyright (C) 2023 The Asahi Linux Contributors

PREFIX ?= /usr/share
WP_DIR ?= /etc/wireplumber
PW_DIR ?= /etc/pipewire

all: aliases

aliases: aliases-j274 aliases-j314 aliases-j316

aliases-j274:
	make -f $$PWD/Makefile -C firs/j274 graph-j473.json graph-j474.json

aliases-j314:
	make -f $$PWD/Makefile -C firs/j314 graph-j414.json

aliases-j316:
	make -f $$PWD/Makefile -C firs/j316 graph-j416.json

graph-%.json: graph.json
	sed -E "s/([^/][jJ])$$(basename "$$PWD" | tr -d j)/\1$(patsubst graph-j%.json,%,$@)/g" $< >$@

clean:
	rm -f firs/*/graph-*.json

core:
	install -dDm0755 $(DESTDIR)/$(WP_DIR)/policy.lua.d/
	install -dDm0755 $(DESTDIR)/$(WP_DIR)/main.lua.d/
	install -dDm0755 $(DESTDIR)/$(PW_DIR)/pipewire.conf.d/
	install -pm0644 conf/99-asahi-policy.lua $(DESTDIR)/$(WP_DIR)/policy.lua.d/99-asahi-policy.lua
	install -pm0644 conf/99-asahi-monitor.lua $(DESTDIR)/$(WP_DIR)/main.lua.d/99-asahi-monitor.lua
	install -pm0644 conf/99-asahi.conf $(DESTDIR)/$(PW_DIR)/pipewire.conf.d/99-asahi.conf
	install -dDm0755 $(DESTDIR)/$(PREFIX)/asahi-audio/

j%: core
	install -dDm0755 $(DESTDIR)/$(PREFIX)/asahi-audio/$@/
	install -pm0644 -t $(DESTDIR)/$(PREFIX)/asahi-audio/$@/ $(wildcard firs/$@/*)


install: aliases core j274 j314 j316 j415

uninstall:
	rm -f $(DESTDIR)/$(WP_DIR)/policy.lua.d/99-asahi-policy.lua
	rm -f $(DESTDIR)/$(WP_DIR)/main.lua.d/99-asahi-monitor.lua
	rm -rf $(DESTDIR)/$(PREFIX)/asahi-audio/
	rm -rf $(DESTDIR)/$(PW_DIR)/pipewire.conf.d/99-asahi.conf
