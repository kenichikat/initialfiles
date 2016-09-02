TARGETS = .zshrc .tmux.conf .vimrc .gitconfig login.sql

prepare:
	test -d $(CURDIR)/backup || mkdir $(CURDIR)/backup

define mksym
$(1):
	mv ${HOME}/$1 backup/$1.`date +%Y%m%d%H%M`
	ln -s $(CURDIR)/$1 ${HOME}/$1
endef

.PHONY: all
all: prepare $(TARGETS)
	$(foreach target,$(TARGETS),$(eval $(call mksym $(target))))
