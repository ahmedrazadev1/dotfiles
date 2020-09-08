#!/usr/bin/env bash


# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


echo "Hey $(whoami), go get some food 🍕🌮 while I'm setting up your Mac!"

echo "mkdir -p ${HOME}/codes"
mkdir -p "${HOME}/codes"


echo "installing homebrew"
# install homebrew https://brew.sh
homebrew_prefix="/usr/local"

if [ -d "$homebrew_prefix" ]; then
  if ! [ -r "$homebrew_prefix" ]; then
    sudo chown -R "$LOGNAME:admin" /usr/local
  fi
else
  sudo mkdir "$homebrew_prefix"
  sudo chflags norestricted "$homebrew_prefix"
  sudo chown -R "$LOGNAME:admin" "$homebrew_prefix"
fi

if ! command -v brew >/dev/null; then
  curl -fsS \
    'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

brew update

echo "brew installing stuff"
# ripgrep: rg is faster than alternatives
# imagemagick: eventually I will need this for something
# ffmpeg: eventually I'll need this for something
# tree: really handy for listing out directories in text
# bat: A cat(1) clone with syntax highlighting and Git integration.
# switchaudio-osx: allows me to switch the audio device via the command line
brew install ripgrep imagemagick watchman tree bat \
delta switchaudio-osx

echo "installing node (via nvm)"
# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# Install and use node version 12 by default
nvm install 12
nvm alias default 12

# Install yarn
curl -o- -L https://yarnpkg.com/install.sh | bash

echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"
echo "yarn --version: $(yarn --version)"

echo "installing a few global npm packages"
yarn global add serve fkill-cli npm-quick-run \
semantic-release-cli npm-check-updates create-react-app prettier

echo "installing apps with brew cask"
brew cask install google-chrome firefox bettertouchtool \
bartender google-drive-file-stream itsycal visual-studio-code 1password \
screenflow marshallofsound-google-play-music-player skype workflowy \
sublime-text vlc obs handbrake zoomus betterzip avibrazil-rdm sip \
qlcolorcode qlmarkdown qlstephen quicklook-json webpquicklook \
suspicious-package qlvideo focus qmoji slack intellij-idea upwork \
hubstaff insomnia adoptopenjdk/openjdk/adoptopenjdk8

echo "Generating an RSA token for GitHub"
mkdir -p ~/.ssh
touch ~/.ssh/config
ssh-keygen -t rsa -b 4096 -C "iamfotx@gmail.com"
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa" | tee ~/.ssh/config
eval "$(ssh-agent -s)"
pbcopy < ~/.ssh/id_rsa.pub
echo "RSA token has been copied to clipboard, paste that into GitHub"


while true; do
    read -p "Did you add the RSA token to Github?" yn
    case $yn in
      [Yy]* )
        yarn && yarn start;;
      [Nn]* ) echo "Please add RSA token into Github & then execute 'yarn && yarn install'"; exit;;
      * ) echo "Please answer yes or no.";;
    esac
done
