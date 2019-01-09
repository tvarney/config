
all: directories config shutils

directories: dir_bin dir_source dir_go

dir_bin:
	mkdir -p "${HOME}/bin"
	mkdir -p "${HOME}/sbin"

dir_source:
	mkdir -p "${HOME}/Source/Applications"
	mkdir -p "${HOME}/Source/Misc"
	mkdir -p "${HOME}/Source/Games"
	mkdir -p "${HOME}/Source/Libraries"
	mkdir -p "${HOME}/Source/Tools"

dir_go:
	mkdir -p "${HOME}/Source/Golang"


config: config_bash config_vim

config_bash:
	cp ./bash/bashrc "${HOME}/.bashrc"
	cp ./bash/profile "${HOME}/.profile"
	cp ./bash/aliases "${HOME}/.aliases"
	cp ./bash/path "${HOME}/.path"

config_vim:
	cp ./vim/vimrc "${HOME}/.vimrc"

shutils:
	git clone https://github.com/tvarney/shutil.git ./shutil/
	$(MAKE) -C ./shutil/ install

