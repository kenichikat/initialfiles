FILES = .gitconfig .tmux.conf .vimrc .zshrc .asdfrc

all: ln_files

ln_files:
	test -d $(CURDIR)/backup || mkdir backup
	for i in $(FILES); do \
		test -f $(HOME)/$$i && mv $(HOME)/$$i backup/$$i.`date +%Y%m%d%H%M`; \
		ln -s $(CURDIR)/$$i ${HOME}/$$i; \
	done
