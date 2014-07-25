## dotfiles

![Real programmers use these dotfiles](http://imgs.xkcd.com/comics/real_programmers.png)

### Vim plugins


1. [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
2. [nerdtree](https://github.com/scrooloose/nerdtree)
3. [Ack](https://github.com/mileszs/ack.vim)
4. [lightline](https://github.com/itchyny/lightline.vim)
5. [neocomplcache](https://github.com/Shougo/neocomplcache.vim)
6. [TComment](https://github.com/tomtom/tcomment_vim)

## Setup

install [pathogen](https://github.com/tpope/vim-pathogen) if you have not already

    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

clone this repo to ~/dotfiles

    cd ~/dotfiles
    ./setup.sh
    git submodule init
    git submodule update
    git submodule foreach git pull origin master
