" Set nocompatible mode
set nocompatible
syntax on

filetype on
filetype plugin indent on
filetype plugin on
set bs=2

" Pathogen
"
call pathogen#infect()

" USE SYSTEM CLIPBOARD??????
" Maybe with tmux?
"set clipboard=unnamed

"  
set t_Co=256
colorscheme bandit256
set background=dark

" Automatically fix line length
"
map <C-M> <S-J><S-V>gq

" Set tab options
"
set nosmartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Sorry vimmers, it's just plain nice to beable to 
" sit back and scroll with the mouse.
set mouse=a

" Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2


"" Easier split navigation
"
map <C-J> <C-W>j<C-W>_ :set relativenumber<Return>
map <C-K> <C-W>k<C-W>_ :set relativenumber<Return>
map <C-H> <C-W>h<C-W>_ :set relativenumber<Return>
map <C-L> <C-W>l<C-W>_ :set relativenumber<Return>

" Easy Tab Navigation
map <C-P> :tabp<Return>
map <C-N> :tabn<Return>

" better working with long lines
map j gj
map k gk

"" LatexStuff
map <C-I> <Plug>IMAP_JumpForward
let g:Imap_UsePlaceHolders = 0

"" Some Commands to make NERDTree a bit nicer.
"
map <F2> :NERDTreeToggle<CR>
map <F1> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$']

" Auto Load Arm Syntax
"
let asmsyntax='armasm'
let filetype_inc='armasm'

" Jinja settings
autocmd BufNewFile,BufRead *.jinja2 set syntax=htmljinja
autocmd FileType jinja setlocal noexpandtab

" CSS
autocmd FileType css setlocal noexpandtab


" Enable some better java hilighting
" 
let java_highlight_all=1
let java_highlight_functions=1

" Enable full Python highlighting
" 
let python_highlight_exceptions = 1
let python_highlight_builtin_funcs = 1
let python_highlight_builtin_objs = 1
let python_slow_sync=1
let python_highlight_all=1

" C++ settings
"
autocmd FileType h setlocal noexpandtab
autocmd FileType cpp setlocal noexpandtab
autocmd FileType c setlocal noexpandtab

" Search hilighting.  <Space> clears the highlight
set hlsearch
"highlight Search ctermfg=Black ctermbg=Red cterm=NONE
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" tag complete
map <C-C> <C-P>_

" Haskell
let g:haddock_browser = 1
let hs_highlight_delimiters = 1

" au VimEnter * IndentGuidesEnable
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 4
autocmd VimEnter * IndentGuidesEnable
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=14
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=13

" Relative line settings
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <C-B> :call NumberToggle()<cr>
set relativenumber
au FocusLost * set number
au FocusGained * set relativenumber
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber
            j

hi CursorLine   cterm=NONE ctermbg=12 
hi CursorColumn cterm=NONE ctermbg=12
set cursorline!
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Colours
let g:EasyColourCustomColours = 1
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au BufReadPost * if b:current_syntax != "htmljinja"
au BufReadPost * RainbowParenthesesLoadBrace
au BufReadPost * endif
