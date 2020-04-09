"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install plugins.
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Code completion.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Adds file type icons to Vim plugins.
" Get a Nerd Font! or patch your own. Without this, things break
Plug 'ryanoasis/vim-devicons'

"Plug 'airblade/vim-gitgutter'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'preservim/nerdtree'

" Beautify vim statsline.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Switch between windows quickly.
Plug 'christoomey/vim-tmux-navigator'

" colorscheme
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

" Quick comment
Plug 'preservim/nerdcommenter' 

" Auto generate documentation.
Plug 'kkoomen/vim-doge'

" Easy align.
Plug 'junegunn/vim-easy-align'

" Rainbow bracket to make bracket more readable.
Plug 'luochen1990/rainbow'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter settings.
" Use <ctrl-/> to toggle comments in code.
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" doge settings.
" Choose one documentation style.
"let g:doge_doc_standard_python = 'numpy'
let g:doge_doc_standard_python = 'google'
" let g:doge_doc_standard_python = 'reST'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow settings.
" Activate rainbow plugin.
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Let NERDTree igonre files
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '__pycache__$']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line, use `:help coc-status` to see more info.
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#coc#error_symbol = ''
let airline#extensions#coc#warning_symbol = '  '
let g:airline_theme='badwolf'  "可以自定义主题，这里使用 badwolf
" let g:lightline = {
" \ 'colorscheme': 'badwolf',
" \ 'active': {
" \   'left': [ [ 'mode', 'paste' ],
" \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
" \ },
" \ 'component_function': {
" \   'cocstatus': 'coc#status'
" \ },
" \ }
"set statusline^=%{StatusDiagnostic()}%{get(b:,'coc_current_function','')}

" autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.vim settings.
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
 

" Remap for symbol renaming.
nmap <F2> <Plug>(coc-rename)


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')


" Formatting selected code.
" Need install autopep8 first time running.
" Needless for me.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Basic settings.
colorscheme gruvbox
set updatetime=300
set signcolumn=yes
set shell=/bin/bash
set nu
set relativenumber
set laststatus=2
set expandtab       " Always use spaces instead of tabs.
set tabstop=2       " Tab width after characters. 
set shiftwidth=4    " Tab stop before characters.
set encoding=UTF-8
filetype plugin on
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
