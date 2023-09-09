# SPDX-License-Identifier: MIT
# Copyright (C) 2023 The Asahi Linux Contributors

PREFIX ?= /usr/share
WP_DIR ?= /etc/wireplumber
PW_DIR ?= /etc/pipewire

default:

core:
	install -dDm0755 $(DESTDIR)/$(WP_DIR)/policy.lua.d/
	install -dDm0755 $(DESTDIR)/$(WP_DIR)/main.lua.d/
	install -dDm0755 $(DESTDIR)/$(PW_DIR)/pipewire.conf.d/
	install -pm0644 conf/99-asahi-policy.lua $(DESTDIR)/$(WP_DIR)/policy.lua.d/99-asahi-policy.lua
	install -pm0644 conf/99-asahi-monitor.lua $(DESTDIR)/$(WP_DIR)/main.lua.d/99-asahi-monitor.lua
	install -pm0644 conf/99-asahi.conf $(DESTDIR)/$(PW_DIR)/pipewire.conf.d/99-asahi.conf
	install -dDm0755 $(DESTDIR)/$(PREFIX)/asahi-audio/

j314: core
	install -dDm0755 $(DESTDIR)/$(PREFIX)/asahi-audio/j314/
	install -pm0644 -t $(DESTDIR)/$(PREFIX)/asahi-audio/j314/ $(wildcard firs/j314/*)

j415: core
	install -dDm0755 $(DESTDIR)/$(PREFIX)/asahi-audio/j415/
	install -pm0644 -t $(DESTDIR)/$(PREFIX)/asahi-audio/j415/ $(wildcard firs/j415/*)

j316: core
	install -dDm0755 $(DESTDIR)/$(PREFIX)/asahi-audio/j316/
	install -pm0644 -t $(DESTDIR)/$(PREFIX)/asahi-audio/j316/ $(wildcard firs/j316/*)

mini: core
	install -dDm0755 $(DESTDIR)/$(PREFIX)/asahi-audio/mini/
	install -pm0644 -t $(DESTDIR)/$(PREFIX)/asahi-audio/mini/ $(wildcard firs/mini/*)

install: core j314 j316 mini j415

uninstall:
	rm -f $(DESTDIR)/$(WP_DIR)/policy.lua.d/99-asahi.lua
	rm -f $(DESTDIR)/$(WP_DIR)/main.lua.d/99-asahi-monitor.lua
	rm -rf $(DESTDIR)/$(PREFIX)/asahi-audio/
	rm -rf $(DESTDIR)/$(PW_DIR)/pipewire.conf.d/99-asahi.conf
