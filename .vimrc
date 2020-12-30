set nu
set hlsearch
colorscheme desert
syntax on
set smartcase
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set laststatus=2
let g:ConqueTerm_Color=2
" Shift-Enter to add empty line on top
nmap <S-Enter> O<Esc>
" Enter to add empty line on bottom
nmap <CR> o<Esc>
" Ctrl + I to break current line at the cursor and move to new line
nmap <c-i> i<Enter><Esc>
" \n to open file browser
nmap \n :NERDTree <CR>
"delete trailing white space
nmap \r %s/\s\+$//g <CR>
"cd into the current buffer's location
nmap \cd :cd %:p:h <CR>
filetype plugin indent on

" set shiftwidth = 4 with expandtab
nmap \4 :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>

" set shiftwidth = 2 with expandtab
nmap \2 :set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>

"the following line will convert tab to spaces
"set expandtab

"diff between two current buffers on split
":windo diffthis and :windo diffoff


"diff current buffer and file on disk
"diff with command :DiffSaved, quit with command :diffoff
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"to turn off automatic newline to adjust to textwidth :set formatoptions-=tc,
"for help look at :help formatoptions
"

"vim airline configuration
let g:airline_theme = 'powerlineish'
let g:airline#extentions#hunks#enabled=0
let g:airline#extentions#branch#enabled=0
let g:airline_section_z = '%p%% %l/%L:%02c'

"automatic toggle relative line number
" au FocusLost * :set number
" au FocusGained * :set relativenumber
set relativenumber

"Function to delete trailing spaces
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
noremap <leader>r :call DeleteTrailingWS()<CR>

"shortcut for tag bar toggling
nmap \g :TagbarToggle <CR>

"for vim-easymotion
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

"for vim-indent-guide custom color, it won't work with torte colorscheme
"anyway
"Keyboard shortcut: \ig
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_indent_levels = 30
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#202020   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#101010 ctermbg=4

"shortcut for vim surround
"Select then add braces: S[
"Select then add html tag arround: S<div>
"Delete surrounding braces: ds[
"Delete the nearest surrounding tag: dst

"add the vertical line to show the tab indentation
"\w to turn it on and \q to turn it off
:set list lcs=tab:\|\
nmap \w :set list <CR>
nmap \q :set nolist <CR>

"to move a code block up and down
"Alt-j and Alt-k

"to move the screen without moving the cursor
"Ctrl-j and Ctrl-k

"to convert spaces to tab
":Retab 4
:command! -nargs=1 -range Retab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

"to convert tab to spaces
":set expandtab
":retab

"to change 2 spaces to 4 spaces or vice versa
":set shiftwidth=<number>
"gg=G

"to search whole word only
":/\<myWord\>

" set colorcolumn to guide line width
set colorcolumn=81

" set NERDCommenter to leave a space after # or //
let g:NERDSpaceDelims = 1

" for MacOS to share clipboard
set clipboard=unnamed

"the following will make tab 2 space wide but no convert tab to space
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" option for gvim
" no menubar
set guioptions-=m
" no toolbar
set guioptions-=T
" no scrollbar
set guioptions-=r

func! HashRocketSyntaxConversion()
  %s/:\([^=,'" ]*\)\s*=>/\1:/ge
endfunc
noremap <leader>h :call HashRocketSyntaxConversion()<CR>

let g:ctrlp_custom_ignore = 'node_modules'

"NERDTree show hidden files
let NERDTreeShowHidden=1
