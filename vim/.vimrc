" Set to auto read when a file is changed externally
set autoread
let mapleader = "," 
let g:mapleader = "," 


set number
set ruler
set hlsearch
set showmatch
set autoindent
set smartindent

set encoding=utf8

" Remove sounds for errors
set noerrorbells
set novisualbell

"set background=light
"colorscheme default
"colorscheme fx
"colorscheme murphy
colorscheme slate

highlight Search ctermbg=red ctermfg=black
":highlight Normal   ctermfg=Cyan ctermbg=Black
":highlight Cursor   ctermfg=Magenta ctermbg=Magenta
":highlight Constant ctermfg=Red ctermbg=Black
":highlight Comment  cterm=underline ctermfg=LightGreen ctermbg=Black
":highlight NonText  ctermfg=Red ctermbg=Black

" Set tab and max text width
set shiftwidth=8
set tabstop=8
set textwidth=120

let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
	set noexpandtab
else
	set noexpandtab
endif
if _curfile =~ ".*\.tex"
"	set expandtab
	set shiftwidth=4
	set tabstop=4
endif

"autocmd Filetype cpp,hpp setlocal ts=3 sw=3 expandtab textwidth=80
autocmd BufRead  *.cpp,*.hpp,*.ipp,*.md,*.sh,*.hpp.in,*.txt,*.cmake,*.dox,*.py set textwidth=100
autocmd BufRead  *.c,*.h,*.cpp,*.hpp,*.ipp,*.md,*.sh,*.hpp.in,*.txt,*.cmake,*.dox,*.py set cc=+0 "(c)olor(c)olumn to textwidth+0

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite *.c,*.h,*.py,*.cpp,*.hpp,*.hpp.in,*.ipp,*.md,*.dox,*.cmake call DeleteTrailingWS()

" Code folding
set foldmethod=marker


" Remove use of arrow keys for movement
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Spell check
map <leader>ss :setlocal spell! spelllang=en_ca<cr>

" Custom syntax colouring
autocmd BufNewFile,BufRead *DPGSolver/* source ~/Desktop/research/DPGSolver/vim/c_structs.vim

" Use the system clipboard for yanking and pasting (Allows copy/pasting between different instances of vim)
set clipboard=unnamed
