#! /bin/bash

if ! [ -d ~/.dotfiles ]
then
  echo "Please install dotfiles first with:"
  echo "bash <(curl -s https://raw.github.com/1334/dotfiles/master/scripts/install.sh)"
  exit 1
fi

cd ~/.dotfiles
echo "updating dotfiles"
git pull
echo ""

echo "updating submodules"
git submodule foreach git pull origin master
