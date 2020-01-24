# Instructions to apply this repo after cloning
Run all the following command from this repo directory

## Neovim
1. Install Neovim

    For ubuntu: `sudo apt-get install neovim`

    For MacOS: `brew install neovim`
1. Link the neovim setting and .vimrc

    ```
    mkdir -p ~/.config/nvim
    ln -s $PWD/.vimrc ~/.vimrc
    ln -s $PWD/.config/nvim/init.vim ~/.config/nvim/init.vim
    ```
1. Install Vim-plug

    `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
1. Install neovim plugins

    In nvim window
      ```
      :PlugInstall
      :UpdateRemotePlugins
      ```
1. Restart neovim

## VimR
Only applies to MacOS
Download latest vimr release from https://github.com/qvacua/vimr/releases and copy that into /Applications

## bash alias

`echo "source $PWD/alias_setup.sh" >> ~/.bashrc`

## git alias

`bash $PWD/git_alias_setup.sh`
