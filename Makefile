SHELL = /usr/bin/env bash
DEST_BASE := $(HOME)
BK_BASE := $(HOME)/initialfiles_backup
DATE := $(shell date +%Y%m%d%H%M)
HOSTNAME := $(shell hostname -s)
FILES := .gitconfig .tmux.conf .vimrc .zshrc .asdfrc .config/ghostty/config .gitconfig.local.sample
BLOCKFORMULA := apache-spark nmap claude-code ghostty qemu aws-sam-cli awscli azure-cli gcloud-cli aws-vault

all: ln_files

brew_dump:
	brew bundle dump --force --file=$(CURDIR)/Brewfile
	rm -f $(CURDIR)/Brewfile.common $(CURDIR)/Brewfile.kws7
	awk -v blocklist="$(BLOCKFORMULA)" '\
		BEGIN { n = split(blocklist, arr, " "); for (i=1; i<=n; i++) b[arr[i]] = 1 } \
		/^#/ { c = $$0; next } \
		{ \
			split($$0, a, "\""); n = a[2]; \
			if (/^npm / || /^vscode /) { \
				f = "$(CURDIR)/Brewfile.$(HOSTNAME)"; \
			} else { \
				f = (n in b) ? "$(CURDIR)/Brewfile.kws7" : "$(CURDIR)/Brewfile.common"; \
			} \
			if (c) print c > f; \
			print $$0 > f; \
			c = "" \
		}' \
	$(CURDIR)/Brewfile

ln_files:
	for i in $(FILES); do \
		dest_file="$(DEST_BASE)/$$i"; \
		dest_dir="$$(dirname $$dest_file)"; \
		bk_file="$(BK_BASE)/$$i.$(DATE)"; \
		bk_dir="$$(dirname $$bk_file)"; \
		mkdir -p $$dest_dir; \
		if test -f "$$dest_file" && test ! -L "$$dest_file"; then \
			mkdir -p "$$bk_dir"; \
			mv "$$dest_file" "$$bk_file"; \
		fi; \
		ln -sfn "$(CURDIR)/$$i" "$$dest_file"; \
	done
