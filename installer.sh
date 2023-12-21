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

	#Node
	if ! command -v node; then
		curl -fsSL https://fnm.vercel.app/install | bash

		if grep -q "zsh" $SHELL; then
			echo "export PATH='/home/ruben/.local/share/fnm:$PATH' \n eval 'fnm env'" >>.zshrc
			. ~/.zshrc
		elif grep -q "bash" $SHELL; then
			echo "export PATH='/home/ruben/.local/share/fnm:$PATH' \n eval 'fnm env'" >>.bashrc
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
}

CopyConfiguration() {
	git clone https://github.com/Ruben-epic/Ruben-epic-IDE.git
	if [[ ! -d "$HOME/.config" ]]; then
		mkdir ~/.config
	fi
	mv Ruben-epic-IDE ~/.config/nvim
}

InstallUbuntu() {
	echo "Installing programs..."
	sudo apt update && sudo apt install gcc unzip zip libfuse2

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
