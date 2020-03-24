#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cp "${DIR}/.vimrc" ~/.vimrc
cp "${DIR}/.zshrc" ~/.zshrc
cp "${DIR}/.tmux.conf" ~/.tmux.conf
cp "${DIR}/.gitconfig" ~/.gitconfig
