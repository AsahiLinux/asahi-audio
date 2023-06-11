# SPDX-License-Identifier: MIT
# Copyright (C) 2023 The Asahi Linux Contributors

PREFIX = /usr/share
WP_DIR = /etc/wireplumber

core:
	install -dD $(DESTDIR)/etc/wireplumber/policy.lua.d/
	install -m0644 conf/99-asahi.lua $(DESTDIR)/$(WP_DIR)/policy.lua.d/99-asahi.lua
	install -dD $(DESTDIR)/$(PREFIX)/asahi-audio/

j314: core
	install -dD $(DESTDIR)/$(PREFIX)/asahi-audio/j314/
	install -m0644 -t $(DESTDIR)/$(PREFIX)/asahi-audio/j314/ $(wildcard firs/j314/*.wav)

j316: core
	install -dD $(DESTDIR)/$(PREFIX)/asahi-audio/j316/
	install -m0644 -t $(DESTDIR)/$(PREFIX)/asahi-audio/j316/ $(wildcard firs/j316/*.wav)

mini: core
	install -dD $(DESTDIR)/$(PREFIX)/asahi-audio/mini/
	install -m0644 -t $(DESTDIR)/$(PREFIX)/asahi-audio/mini/ $(wildcard firs/mini/*.wav)

install: core j314 j316 mini

uninstall:
	rm -f $(DESTDIR)/$(WP_DIR)/policy.lua.d/99-asahi.lua
	rm -rf $(DESTDIR)/$(PREFIX)/asahi-audio/
