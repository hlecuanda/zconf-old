# vim: number : 

DIRS=git tmux zsh ssh		
RUNCOMS=zlogin zlogout zpreztorc zprofile zshenv zshrc
PREZTO=https://github.com/sorin-ionescu/prezto.git
INSTL=pkg install-y -q 
	
ZDOTDIR=$(HOME)/zconftest
	
.PHONY: packages tmux zsh ssh update upgrade runcoms 	

include $(DIRS).d/Makefile

install: upgrade packages 

packages: upgrade	
	@$(INSTL) zsh git tig vim tmux grep coreutils \
		binutils curl diffutils figlet file \
		grep man mosh openssh python termux-api \
		termux-tools tree
	@termux-setup-storage

upgrade: 
	@echo in upgrade	
	@echo Updating packages
	-pkg update -y -q
	
update: upgrade
	@echo in update
