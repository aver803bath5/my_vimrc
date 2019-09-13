"################### Magic vimrc ###################
" ctrl+n Enable/disable mouse
" ctrl+t Convert tab to spaces
" ctrl+f Switch to full/simple
" zz update the file if there are any changes in the file
"#########################################################

" plugins
call plug#begin("~/.vim/plugged")
" NERDTree
Plug 'scrooloose/nerdtree'
" commentary.vim
Plug 'tpope/vim-commentary'
" Prettier and autoformat
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Chiel92/vim-autoformat'

" pathogen: A plugin to show eslint error and warning while editting js files
Plug 'tpope/vim-pathogen'

" vim-javascript: A plugin provides JS syntex highlighting and improved
" indenation
Plug 'pangloss/vim-javascript'
" Syntax highlight for jsx
Plug 'mxw/vim-jsx'

" Show color in css files
Plug 'ap/vim-css-color'

" Gruvbox theme
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
" vim airline theme
Plug 'vim-airline/vim-airline-themes'

" YouComplelteMe
Plug 'Valloric/YouCompleteMe'

" Show indent guilding line
Plug 'Yggdroot/indentLine'
" Vim-emmet
Plug 'mattn/emmet-vim'
" Rust Plugin
Plug 'rust-lang/rust.vim'
" Git Tool
Plug 'tpope/vim-fugitive'
" Easy align
Plug 'junegunn/vim-easy-align'
" surround.vim
Plug 'tpope/vim-surround'
call plug#end()

" Use python2 to run ycm_server
let g:ycm_server_python_interpreter = '/usr/bin/python3.6'
" Not allow ycm to ask you to confirm loading ycm_extra_conf everytime
let g:ycm_confirm_extra_conf = 1

"####################################################

" pathogen configs
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic configs
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_loc_list_height = 5

" replace tab to two spaces
set tabstop=2
set shiftwidth=2
set expandtab

let g:prettier#autoformat = 1

" Start inertactive EasyAlign in visual node (e.v. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip
nmap ga <Plug> (EasyAlign)
" Show everything but whitespace
set listchars=eol:↵,tab:»·,trail:╳,extends:»,precedes:« 
set list

" Rust format after save
let g:rustfmt_autosave = 1

" make vim support 256 colors
set t_Co=256

" set color theme
" hi setting should be written after colorscheme
" set termguicolors
colorscheme gruvbox

set guifont=Powerline_Consola:h16

" airline theme
let g:airline_theme = 'simple'
" enable powerline fonts
let g:airline_powerline_fonts = 1

set background=dark
" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

" enable highlighting current selecting row
set cursorline

" set Cursorline background and font color, and disable bottom line
" hi CursorLine cterm=none ctermbg=DarkMagenta ctermfg=white

" enable line relative number
set relativenumber
set number

" enable mouse for all mode
" v for visual mode
" i for insert mode 
" c for command mod
" set mouse= for disable mouse
set mouse=a

set encoding=utf-8
scriptencoding utf-8

" highlight all matching text while searching
" set hlsearch

" Enable JSDoc Highlight. This config is related to 'vim-javascript'
let g:javascript_plugin_jsdoc = 1

"##################################################################
" enable vim status bar, set 1 to diable, set 2 to enable
" set laststatus=2
" status bar setting
" set statusline=%#filepath#[%{expand('%:p')}]%#filetype#[%{strlen(&fenc)?&fenc:&enc},\ %{&ff},\ %{strlen(&filetype)?&filetype:'plain'}]%#filesize#%{FileSize()}%{IsBinary()}%=%#position#%c,%l/%L\ [%3p%%]

" hi filepath cterm=none ctermbg=238 ctermfg=40
" hi filetype cterm=none ctermbg=238 ctermfg=45
" hi filesize cterm=none ctermbg=238 ctermfg=225
" hi position cterm=none ctermbg=238 ctermfg=228
"
" function IsBinary()
"   if (&binary == 0)
"     return ""
"   else
"     return "[Binary]"
"   endif
" endfunction
"
" function FileSize()
"   let bytes = getfsize(expand("%:p"))
"   if bytes <= 0
"     return "[Empty]"
"   endif
"   if bytes < 1024
"     return "[" . bytes . "B]"
"   elseif bytes < 1048576
"     return "[" . (bytes / 1024) . "KB]"
"   else
"     return "[" . (bytes / 1048576) . "MB]"
"   endif
" endfunction

"#####################################################################
" Shortcut
" use 'crtl + n' to switch mouse mode
map <C-n> :call SwitchMouseMode()<CR>
map! <C-n> <Esc>:call SwitchMouseMode()<CR>
function! SwitchMouseMode()
  if(&mouse == "a")
    let &mouse = ""
    echo "Mouse is disabled."
  else
    let &mouse = "a"
    echo "Mouse is enabled."
  endif
endfunction

" use 'ctrl + f' to toggle full/simple mode
map! <C-f>: call SwitchFullSimpleMode()<CR>
map! <C-f> <Esc>: call SwitchFullSimpleMode()<CR>
function! SwitchFullSimpleMode()
  if (&mouse == "a")
    let &mouse = ""
    set nocindent
    set nonumber
    set wrap
    echo "Switch to simple mode. (nomouse, nonumber, nocindent, wrap)"
  else
    let &mouse = "a"
    set cindent
    set number
    set nowrap
    echo "Switch to full mode. (mouse, number, cindent, nowrap)"
  endif
endfunction

" use 'crtl + t' to replace all tabs with spaces
map <C-t> :call TabToSpaces()<CR>
map <C-t> <Esc> :call TabToSpaces()<CR>
function! TabToSpaces()
  retab
  echo "Convert tab to spaces"
endfunction
"#############################################

nnoremap zz :update<CR>

