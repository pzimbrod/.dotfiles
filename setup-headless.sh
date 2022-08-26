# Setup file for all the dotfiles along with dependencies
# But that's OS specific


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux flavors
	echo "Proceeding with install scripts for Linux (Debian)"

	# Install dependencies
	sudo apt update
	sudo apt install -y vim stow

	# Copy dotfiles
	echo "Creating symlinks..."
	stow .

	# Run Vundle once to pull all the plugins
	vim -s :PluginInstall

elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
	echo "Proceeding with install scripts for MacOS"

	# PREREQUISITE: We need homebrew
	if ! command -v brew &> /dev/null
	then
    		echo "Homebrew could not be found!"
		echo
    		read -p "Install homebrew now? " -n 1 -r
		echo    # (optional) move to a new line
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
    			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		fi
	fi
		
	# PREREQUISITE: We need Stow
	if ! command -v stow &> /dev/null
	then
    		echo "Stow could not be found!"
		echo
		echo "Installing Stow..."
		brew install stow
	fi

	# Copy dotfiles
	echo "Creating symlinks..."
	stow .

	# Run Vundle once to pull all the plugins
	vim -s :PluginInstall
else
	echo "Dotfiles repo is set up to work with Linux or MacOS only! Aborting."
fi

