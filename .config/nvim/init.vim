set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin()
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'matze/vim-move'
Plug 'reedes/vim-wheel'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'leafgarland/typescript-vim'
Plug 'djoshea/vim-autoread'
call plug#end()
