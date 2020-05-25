	"Mappings
vmap <C-y> "+y
map <C-n> :NERDTreeToggle<CR>
let g:mapleader='m'
"map <Leader> <Plug>(easymotion-prefix) 
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>
map <ESC>g :Git
map <ESC>p :PlugInstall<CR>
map <ESC>s :%s/
map <C-s> :!sy<CR>
map <ESC>r :!./a<CR>
map <ESC>m :make<CR>
imap <ESC>e =
imap <ESC>p +
nnoremap b n
nnoremap n b
nnoremap B N
nnoremap N B
	" CONFIGS 

map <C-1> :set colorcolumn=110<CR>
highlight ColorColumn ctermbg=darkgray
syntax on
set number
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set clipboard=unnamedplus
set tabstop=3
set hlsearch
set incsearch
set autoindent
"set timeout timeoutlen=200 ttimeoutlen=1
filetype indent on
set wildmenu
set showmatch
colorscheme gruvbox
"au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" ALIASES 
cnoreabbr bld !bld  
cnoreabbr vimrc e ~/.vimrc
cnoreabbr giti  e ~/.gitignore 
cnoreabbr gita  e ~/.gitattributes 
cnoreabbr gitc  e ~/.gitconfig
cnoreabbr bshrc  e ~/.bashrc
cnoreabbr tmux  e ~/.tmux.conf
cnoreabbr vimc e ~/texts/diary/conspect/vim

" FUNCTIONS
 
function! WinMove(key) " ------------- Легкое создание новых окон, СПЛИТТИГ 
		  let t:curwin = winnr()
		  exec "wincmd ".a:key
		  if (t:curwin == winnr())
					 if(match(a:key,'[jk]'))
								wincmd v
					 else
								wincmd s
					 endif
					 exec "wincmd ".a:key
		  endif
endfunction

" SETTINGS FOR PLUGINS =========================================================================================================================================

let g:ycm_global_ycm_extra_conf ="~/.vim/ycm_extra_conf/.ycm_extra_conf.py"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
"let g:snipMate.scope_aliases = {}
"let g:snipMate.scope_aliases['c\++'] = 'c\++'

"let g:ycm_extra_conf ="~/.vim/ycm_extra_conf/ycmd/.ycm_extra_conf.py"
let g:ycm_extra_conf ="~/.vim/ycm_extra_conf/ycm2"

nmap <C-F5> <Esc>:BufExplorer<cr>
vmap <C-F5> <esc>:BufExplorer<cr>
imap <C-F5> <esc>:BufExplorer<cr>

" F6 - предыдущий буфер

nmap <C-F6> :bp<cr>
vmap <C-F6> <esc>:bp<cr>i
imap <C-F6> <esc>:bp<cr>i

" F7 - следующий буфер

nmap <C-F7> :bn<cr>
vmap <C-F7> <esc>:bn<cr>i
imap <C-F7> <esc>:bn<cr>i

" ========================================================================================================================================================

" WORK WITH RUSSIAN LAYOUT

map Ж :
cmap й q
cmap ц w
cmap у e
cmap к r
cmap е t
cmap н y
cmap г u
cmap ш i
cmap щ o
cmap з p
cmap х [
cmap ъ ]
cmap ф a
cmap ы s
cmap в d
cmap а f
cmap п g
cmap р h
cmap о j
cmap л k
cmap д l
cmap ж ;
cmap э '
cmap я z
cmap ч x
cmap с c
cmap м v
cmap и b
cmap т n
cmap ь m
cmap б ,
cmap ю .
map <ESC>e $
map <ESC>n 0

" Установка плагинов  ------------------------------------------------------------------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " -дерево каталогов
	Plug 'ycm-core/YouCompleteMe' " ---------------------------autocomplete
	Plug 'jiangmiao/auto-pairs' " -----------------------------автоматическое закрытие скобок
	Plug 'tpope/vim-fugitive' " -------------------------------для работы с Git
	Plug 'airblade/vim-gitgutter' " ---------------------------easy git diff
	Plug 'kien/ctrlp.vim' " -----------------------------------очень легкий поиск документов
	Plug 'easymotion/vim-easymotion' " ------------------------быстрое перемещение к любым символам
	Plug 'rking/ag.vim' " -------------------------------------легкая замена grep
	Plug 'vim-syntastic/syntastic', { 'on':  'Syntastic' } " --анализатор ошибок
	Plug 'garbas/vim-snipmate' " ------------------------------snipmate 
	Plug 'MarcWeber/vim-addon-mw-utils' " ---------------------snipmate 
   Plug 'tomtom/tlib_vim' " ----------------------------------snipmate 
	Plug 'jlanzarotta/bufexplorer' " --------------------------обзор буферов 
  " Optional:
   Plug 'honza/vim-snippets' " -------------------------------snipmate
	Plug 'artoj/qmake-syntax-vim'
	"Color schemes
	Plug 'morhetz/gruvbox'
	Plug 'vim-scripts/gdbvim'
	Plug 'vim-scripts/ctags.vim'
	"Plug 'xavierd/clang_complete'
call plug#end()

1
2

