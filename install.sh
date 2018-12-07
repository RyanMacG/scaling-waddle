#!/bin/sh
echo "---------------------------------------------------------"
echo "$(tput setaf 2)WHATS THE STORY MOTHER?$(tput sgr 0)"
echo "$(tput setaf 2)INTERFACE 2037 READY FOR INQUIRY$(tput sgr 0)"
echo "---------------------------------------------------------"

INSTALLDIR=~/

echo "---------------------------------------------------------"
echo "$(tput setaf 2)MUTH/UR/6000: Checking for Homebrew installation.$(tput sgr 0)"
echo "---------------------------------------------------------"
brew="/usr/local/bin/brew"

if [ -f "$brew" ]
then
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)MUTH/UR/6000: Homebrew is installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 3)MUTH/UR/6000: Installing osx command lines tools.$(tput sgr 0)"
  xcode-select --install
  echo "$(tput setaf 3)MUTH/UR/6000: Installing Homebrew.$(tput sgr 0)"
  echo "---------------------------------------------------------"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)MUTH/UR/6000: Installing system packages.$(tput sgr 0)"
echo "---------------------------------------------------------"
packages=(
  "git"
  "hub"
  "tmux"
  "neovim"
  "python"
  "zsh"
  "ripgrep"
  "fzf"
  "bat"
  "ranger"
  "fasd"
  "tmux"
  "gnupg"
)

echo "---------------------------------------------------------"
echo "$(tput setaf 2)MUTH/UR/6000: Installing prezto$(tput sgr 0)"
echo "---------------------------------------------------------"
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

for i in "${packages[@]}"
do
  brew install $i
  echo "---------------------------------------------------------"
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)MUTH/UR/6000: Installing ASDF and languages.$(tput sgr 0)"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.2
echo "---------------------------------------------------------"
