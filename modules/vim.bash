# Sets up the vim configuration files.

load-vim() {
  [ -f ~/.bash/.run-once ] && return

  # Install pathogen.vim
  if [ ! -e ~/.vim/autoload/pathogen.vim ]; then
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -so ~/.vim/autoload/pathogen.vim \
      https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
  fi
}
