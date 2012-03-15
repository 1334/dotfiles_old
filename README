# Install plugins as submodules
(using vim-rails as an example)

cd ~/bin/dotfiles
git submodule add https://github.com/tpope/vim-rails.git vim/bundle/rails
git add .
git commit -m "Install Tim Pope's rails vim bundle as a submodule"

# Install dotfiles environment
cd ~/bin
git clone https://1334@github.com/1334/dotfiles.git 
ln -s ~/bin/dotfiles/vim ~/.vim
ln -s ~/bin/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/bin/dotfiles/vim/gvimrc ~/.gvimrc
cd ~/bin/dotfiles
git submodule init
git submodule update

# Upgrade all bundled plugins
cd ~/bin/dotfiles
git submodule foreach git pull origin master
