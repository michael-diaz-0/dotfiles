syntax on
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set backspace=indent,eol,start
set hidden
set incsearch
set scrolloff=8
set number 

set nocompatible " be iMproved, required
filetype off " required

autocmd FileType c,cpp source ~/.vim/syntax/glsl.vim
autocmd FileType c,cpp source ~/.vim/syntax/after/syntax/c/opengl.vim
autocmd FileType c,cpp source ~/.vim/syntax/after/syntax/cpp/opengl.vim

" set Vim-specific sequences for RGB colors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


let g:ycm_global_ycm_extra_conf='/Users/michael/.vim/bundle/youcompleteme/cpp/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 're!gl'] }
let g:clang_complete_macros = 1

set completeopt-=preview

filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bfrg/vim-glfw-syntax'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'gruvbox-community/gruvbox'
Plugin 'tikhomirov/vim-glsl'
Plugin 'hints_opengl.vim'
Plugin 'Kryptocron/glfw.vim'
Plugin 'junegunn/goyo.vim'

"Plugin 'sheerun/vim-polygot'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set termguicolors
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox

" goyo setup "

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

