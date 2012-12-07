#! /bin/bash
function verify_dependencies()
{
  if ! which git > /dev/null; then
    echo "You need git installed in order to proceed" 
    exit 2
  fi

  if ! [ -d ~/.dotfiles ]; then
    clone_repo
  fi
}

function ask_to()
{
	EXPECTED_ARGS=1
	E_BADARGS=65
	usage="usage : ask_to <Question> (eg. ask_to 'install Vim')"

	if [ $# -lt $EXPECTED_ARGS ]
	then
		echo "$usage" && exit 1
  		exit $E_BADARGS
	fi
	
	local question="Do you want to $1? (y/n) "	
	local answer
	local result

	while true
	do
		read -p "$question" answer
		
		case "$answer" in
		y|Y|YES|yes|Yes)
			result=0 && break;;
		n|N|NO|no|No)
			result=-1 && break;;
		*)
			echo "Please provide a valid answer (y or n)";;			
		esac
		
	done

	return $result
}

function setup_vim()
{
	ln -si ~/.dotfiles/vim ~/.vim
	ln -si ~/.dotfiles/vim/vimrc ~/.vimrc
	ln -si ~/.dotfiles/vim/gvimrc ~/.gvimrc
}

function setup_bash()
{
  ln -si ~/.dotfiles/bash/bashrc ~/.bashrc
  ln -si ~/.dotfiles/bash/bash_profile ~/.bash_profile
  source ~/.bash_profile
}

function setup_git()
{
  ln -si ~/.dotfiles/git/gitignore_global ~/.gitignore_global
  ln -si ~/.dotfiles/git/gitconfig ~/.gitconfig
  git config --global core.excludesfile ~/.gitignore_global
}

function setup_gitsubs()
{
  cd ~/.dotfiles
  git submodule init
  git submodule update
}

function clone_repo()
{
  cd
  git clone https://1334@github.com/1334/dotfiles.git .dotfiles
}

verify_dependencies


ask_to 'install Bash'
if [ $? -eq 0 ]
then
	setup_bash
fi

ask_to 'install Vim'
if [ $? -eq 0 ]
then
	setup_vim
fi

ask_to 'configure global gitignore'
if [ $? -eq 0 ]
then
	setup_git
fi
ask_to 'install git submodules'
if [ $? -eq 0 ]
then
	setup_gitsubs
fi


