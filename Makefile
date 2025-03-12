FILES = .gitconfig .tmux.conf .vimrc .zshrc .asdfrc

all: ln_files

ln_files:
	test -d $(CURDIR)/backup || mkdir backup
	for i in $(FILES); do \
		test -f $(HOME)/$$i && mv $(HOME)/$$i $(CURDIR)/backup/$$i.`date +%Y%m%d%H%M`; \
		ln -s $(CURDIR)/$$i ${HOME}/$$i; \
	done

# TODO: $(HOME)直下に置かないものについて検討
	mkdir -p $(HOME)/.config/ghostty
	test -f $(HOME)/.config/ghostty/config && mv $(HOME)/.config/ghostty/config $(CURDIR)/backup/ghostty_config.`date +%Y%m%d%H%M`
	ln -s $(CURDIR)/ghostty_config $(HOME)/.config/ghostty/config
