SHELL = /usr/bin/env bash
HOME_DIR := $(HOME)
VSCODE_USER_DIR := $(HOME)/Library/Application Support/Code/User
DATE := $(shell date +%Y%m%d%H%M)
FILES := \
	home/.gitconfig \
	home/.tmux.conf \
	home/.vimrc \
	home/.zshrc \
	home/.asdfrc \
	home/.config/ghostty/config \
	home/.config/starship.toml \
	vscode/settings.json \
	vscode/keybindings.json \
	vscode/snippets
BLOCKFORMULA := apache-spark nmap claude-code qemu aws-sam-cli awscli azure-cli gcloud-cli aws-vault ollama gh

all:
	@read -p "Run brew_bundle? [y/N] " ans; \
	case "$$ans" in \
		[yY]*) $(MAKE) brew_bundle ;; \
		*) echo "Skipping brew_bundle" ;; \
	esac
	@$(MAKE) setup

brew_bundle:
	@command -v brew >/dev/null 2>&1 || { echo "brew command not found" >&2; exit 1; }
	brew bundle --file=$(CURDIR)/Brewfile.common

brew_dump:
	brew bundle dump --force --file=$(CURDIR)/Brewfile
	rm -f $(CURDIR)/Brewfile.common $(CURDIR)/Brewfile.add
	awk -v blocklist="$(BLOCKFORMULA)" '\
		BEGIN { n = split(blocklist, arr, " "); for (i=1; i<=n; i++) b[arr[i]] = 1 } \
		/^#/ { c = $$0; next } \
		{ \
			split($$0, a, "\""); n = a[2]; \
			if (/^npm / || /^vscode /) { \
				f = "$(CURDIR)/Brewfile.add"; \
			} else { \
				f = (n in b) ? "$(CURDIR)/Brewfile.add" : "$(CURDIR)/Brewfile.common"; \
			} \
			if (c) print c > f; \
			print $$0 > f; \
			c = "" \
		}' \
	$(CURDIR)/Brewfile

setup:
	@for i in $(FILES); do \
		case "$$i" in \
			home/*)   dest_base="$(HOME_DIR)";       rel="$${i#home/}"   ;; \
			vscode/*) dest_base="$(VSCODE_USER_DIR)"; rel="$${i#vscode/}" ;; \
		esac; \
		dest_file="$$dest_base/$$rel"; \
		dest_dir="$$(dirname "$$dest_file")"; \
		echo "Linking $$i to $$dest_file"; \
		mkdir -p "$$dest_dir"; \
		if test -e "$$dest_file" && test ! -L "$$dest_file"; then \
			mv "$$dest_file" "$$dest_file.$(DATE)"; \
		fi; \
		ln -sfn "$(CURDIR)/$$i" "$$dest_file"; \
	done
	@echo "Copying home/.gitconfig.local.sample to $(HOME_DIR)/.gitconfig.local.sample"
	@cp "$(CURDIR)/home/.gitconfig.local.sample" "$(HOME_DIR)/.gitconfig.local.sample"
