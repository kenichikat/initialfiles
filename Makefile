SHELL = /usr/bin/env bash
DEST_BASE := $(HOME)
BK_BASE := $(HOME)/initialfiles_backup
DATE := $(shell date +%Y%m%d%H%M)
FILES := .gitconfig .tmux.conf .vimrc .zshrc .asdfrc .config/ghostty/config

all: ln_files

ln_files: $(FILES)
	echo "test -d $(BK_BASE) || mkdir $(BK_BASE)"
	for i in $(FILES); do \
		dest_file="$(DEST_BASE)/$$i"; \
		dest_dir="$$(dirname $$dest_file)"; \
		bk_file="$(BK_BASE)/$$i.$(DATE)"; \
		bk_dir="$$(dirname $$bk_file)"; \
		mkdir -p $$dest_dir; \
		mkdir -p $$bk_dir; \
		test -f $$dest_file && mv $$dest_file $$bk_file; \
		ln -s $(CURDIR)/$$i $$dest_file; \
	done
