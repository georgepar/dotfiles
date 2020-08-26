set -x
bash initialize.sh
echo "Installing necessary packages using apt-get (requires sudo)"
bash install_packages.sh
echo "Installing cheat"
bash setup_cheat.sh
echo "Installing anaconda environment with packages in requirements.txt"
bash setup_anaconda.sh
echo "Configuring git"
bash setup_git.sh
echo "Configuring vim and installing extensions"
bash setup_vim.sh
echo "Setting up zsh"
bash setup_zsh.sh
