
all: directories config shutils

directories: dir_bin dir_source dir_go

.PHONY: dir_bin
dir_bin:
	mkdir -p "${HOME}/bin"
	mkdir -p "${HOME}/sbin"

.PHONY: dir_source
dir_source:
	mkdir -p "${HOME}/Source/Applications"
	mkdir -p "${HOME}/Source/Misc"
	mkdir -p "${HOME}/Source/Games"
	mkdir -p "${HOME}/Source/Libraries"
	mkdir -p "${HOME}/Source/Tools"

.PHONY: dir_go
dir_go:
	mkdir -p "${HOME}/Source/Golang"

.PHONY: config
config: config_bash config_vim config_tmux

.PHONY: config_bash
config_bash:
	cp ./bash/bashrc "${HOME}/.bashrc"
	cp ./bash/profile "${HOME}/.profile"
	cp ./bash/aliases "${HOME}/.aliases"
	cp ./bash/path "${HOME}/.path"

.PHONY: config_vim
config_vim: vim_packages
	cp ./vim/vimrc "${HOME}/.vimrc"

.PHONY:
config_tmux:
	cp ./tmux/tmux.conf "${HOME}/.tmux.conf"

.PHONY: vim_packages
vim_packages:
	./vim/packages.sh

.PHONY: shutils
shutils:
	git clone https://github.com/tvarney/shutil.git ./shutil/
	$(MAKE) -C ./shutil/ install

