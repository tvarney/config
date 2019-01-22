
all: directories config shutils

directories: dir_bin dir_source dir_go

.PHONEY: dir_bin
dir_bin:
	mkdir -p "${HOME}/bin"
	mkdir -p "${HOME}/sbin"

.PHONEY: dir_source
dir_source:
	mkdir -p "${HOME}/Source/Applications"
	mkdir -p "${HOME}/Source/Misc"
	mkdir -p "${HOME}/Source/Games"
	mkdir -p "${HOME}/Source/Libraries"
	mkdir -p "${HOME}/Source/Tools"

.PHONEY: dir_go
dir_go:
	mkdir -p "${HOME}/Source/Golang"

.PHONEY: config
config: config_bash config_vim

.PHONEY: config_bash
config_bash:
	cp ./bash/bashrc "${HOME}/.bashrc"
	cp ./bash/profile "${HOME}/.profile"
	cp ./bash/aliases "${HOME}/.aliases"
	cp ./bash/path "${HOME}/.path"

.PHONEY: config_vim
config_vim: vim_packages
	cp ./vim/vimrc "${HOME}/.vimrc"

.PHONEY: vim_packages
vim_packages:
	./vim/packages.sh

.PHONEY: shutils
shutils:
	git clone https://github.com/tvarney/shutil.git ./shutil/
	$(MAKE) -C ./shutil/ install

