#!/bin/bash
#

os=/etc/os-release
system=""

InstallNeovim() {

	case $system in

	"Ubuntu")
		if [ ! -f /usr/bin/nvim ]; then
			echo "installing on Ubuntu"

			vimInst="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
			wget $vimInst

			chmod +x nvim.appimage
			sudo mv nvim.appimage /usr/bin/nvim

			echo "Neovim has installed"

		else
			echo "Neovim is installed"
		fi
		;;

	"Arch")
		echo "Installing on Arch"
		;;
	esac
}

InstallDependencies() {
	#git

	#Node
	if ! command -v node; then
		curl -fsSL https://fnm.vercel.app/install | bash

		if grep -q "zsh" $SHELL; then
			. ~/.zshrc
		elif grep -q "bash" $SHELL; then
			. ~/.bashrc
		fi

		fnm ls-remote
		fnm install --lts
	fi

	#Java
	if ! command -v sdk; then
		curl -s "https://get.sdkman.io" | bash
		. ~/.sdkman/bin/sdkman-init.sh
		sdk version
	fi
	if ! command -v java; then
		sdk install java
		sdk install gradle
	fi

	if grep -q "zsh" $SHELL; then
		. ~/.zshrc
	elif grep -q "bash" $SHELL; then
		. ~/.bashrc
	fi
}

CopyConfiguration() {
	git clone https://github.com/Ruben-epic/Ruben-epic-IDE.git
	if [[ ! -d "$HOME/.config" ]]; then
		echo "No existe"
		mkdir $HOME/.config
	fi
	mv Ruben-epic-IDE $HOME/.config/nvim
}

InstallUbuntu() {
	echo "Installing programs..."
	sudo add-apt-repository ppa:git-core/ppa
	sudo apt update
	sudo apt install gcc unzip zip libfuse2 git

	InstallNeovim
	CopyConfiguration
	InstallDependencies

	if [[ $? -ne 0 ]]; then
		echo "Error has ocurred"
	fi
	echo "Program has installed successfully"
}

InstallArch() {
	echo "Installing Programs..."
	InstallNeovim
}

if grep -q "Ubuntu" $os; then
	system="Ubuntu"
	InstallUbuntu
else
	system="Arch"
	InstallArch
fi
