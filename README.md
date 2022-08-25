# .dotfiles

You should have GNU Stow installed to handle the dotfiles.

# Contents

## ZSH

Plugins are controlled by antigen. Just create a symlink to .zshrc (ideally with stow) and antigen will install all the plugins specified.

## Vim

Plugins are controlled by Vundle. The plugins are part of the repo, there shouldn't be any setup required.

## Emacs

The config is set up to use DOOM Emacs. run doom sync in order to generate everything.
