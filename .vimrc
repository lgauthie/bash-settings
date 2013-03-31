" Set nocompatible mode
set nocompatible
syntax on

filetype on
filetype plugin indent on
filetype plugin on
set bs=2
set ttymouse=urxvt

set nofoldenable
set lazyredraw

" Pathogen
"
call pathogen#infect()

" Golden Ratio Plug
"
let g:golden_ratio_autocommand = 0
map <leader><leader> :GoldenRatioResize<return>

" USE SYSTEM CLIPBOARD??????
" Maybe with tmux?
"set clipboard=unnamed

set t_Co=256
colo xoria256
"colorscheme solarized
" colorscheme grb256
set guifont=Source\ Code\ Pro:h12
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1

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
nnoremap <C-J> <C-W>j :call LineNums(1)<return>
nnoremap <C-K> <C-W>k :call LineNums(1)<return>
nnoremap <C-H> <C-W>h :call LineNums(1)<return>
nnoremap <C-L> <C-W>l :call LineNums(1)<return>

" Easy Tab Navigation
noremap <C-P> :tabp<Return>
noremap <C-N> :tabn<Return>

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
autocmd BufNewFile,BufRead *.jinja2 set tabstop=4
autocmd BufNewFile,BufRead *.jinja2 set shiftwidth=4
autocmd BufNewFile,BufRead *.jinja2 set noexpandtab

" js settings
"let g:syntastic_javascript_closure_compiler_path = '/Users/lee/working/mediacore/private/plovr/closure/closure-library/compiler.jar'
autocmd BufNewFile,BufRead *.js set tabstop=2
autocmd BufNewFile,BufRead *.js set shiftwidth=2
autocmd BufNewFile,BufRead *.js set expandtab
autocmd BufNewFile,BufRead *.jinja2js set syntax=htmljinja
autocmd BufNewFile,BufRead *.jinja2js set tabstop=2
autocmd BufNewFile,BufRead *.jinja2js set shiftwidth=2
autocmd BufNewFile,BufRead *.jinja2js set expandtab

" CSS
"
autocmd FileType css setlocal noexpandtab


" Java Settings
"
let java_highlight_all=1
let java_highlight_functions=1

autocmd FileType java setlocal noexpandtab
autocmd FileType jsp setlocal noexpandtab

" Enable full Python highlighting
"
let python_highlight_exceptions = 1
let python_highlight_builtin_funcs = 1
let python_highlight_builtin_objs = 1
let python_slow_sync=1
let python_highlight_all=1

" Python settings
" TODO: Make this autocmd stuff a function so it is easier
"       to remove...
autocmd FileType py setlocal tabstop=4
autocmd FileType py setlocal shiftwidth=4
autocmd FileType py setlocal expandtab

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

" Relative line settings
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

function! LineNums(relative)
    if (&ft != "nerdtree" && &ft != "gitv")
        if (a:relative == 0)
            set number
        elseif (a:relative == 1)
            set relativenumber
        endif
    endif
endfunc

nnoremap <C-B> :call NumberToggle()<cr>
call LineNums(1)
au FocusLost * call LineNums(0)
au FocusGained * call LineNums(1)
autocmd InsertEnter * call LineNums(0)
autocmd InsertLeave * call LineNums(1)

hi CursorLine   cterm=NONE ctermbg=0
hi CursorColumn cterm=NONE ctermbg=14
set cursorline!
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Colours
let g:EasyColourCustomColours = 1
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au BufReadPost * if exists("b:current_syntax") && b:current_syntax != "htmljinja"
au BufReadPost *    RainbowParenthesesLoadBrace
au BufReadPost * endif

" Sort a block of imports (or any block. blocks are separated by blank lines
nnoremap <leader>si vip:!sort\|uniq<cr>

" Split the comma separated import on the current line into two separate
" imports, then sort. Returns to the same line after, so can be repeated
" when there are many imports on the same line.
nnoremap <leader>fi 0v/import<cr>eyf,pF,s<cr><esc>vip:!sort\|uniq<cr>

set incsearch
set wildmenu
set wildmode=longest:full

" Easy Retabing!
command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" Hilight trailing whitespace!
highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" Gitv
let g:Gitv_DoNotMapCtrlKey=1
let g:Gitv_OpenPreviewOnLaunch=1
cnoreabbrev gitx Gitv

" Fugitive stuff
cnoreabbrev gits Gstatus
cnoreabbrev gitd Gdiff
cnoreabbrev git Git
cnoreabbrev gitrbi Git rebase -i
cnoreabbrev gitrbo Git rebase --onto
cnoreabbrev gitrbc Git rebase --continue
cnoreabbrev gitpo Git push origin

" Diff Stuff
nnoremap ,p :diffput<return>
nnoremap ,g :diffget<return>
nnoremap ,u :diffupdate<return>

vnoremap ,p :diffput<return>
vnoremap ,g :diffget<return>
