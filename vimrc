set nocompatible              " be iMproved, required

if has("syntax")
  syntax on
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'HerringtonDarkholme/yats.vim'
" or Plug 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'

" Plugin 'leafgarland/typescript-vim'
" Plugin 'peitalin/vim-jsx-typescript'
" Plugin 'ianks/vim-tsx'
" Plugin 'pangloss/vim-javascript'
" let g:javascript_plugin_jsdoc = 1

Plugin 'chr4/nginx.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'scrooloose/nerdtree'
let g:NERDTreeIgnore=['dist', '\.pyc$']
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
" Plugin 'vim-scripts/a.vim'
" Plugin 'tpope/vim-surround'

" Plugin 'vim-syntastic/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" Plugin 'plasticboy/vim-markdown'
" let g:vim_markdown_folding_disabled=1
" let g:vim_markdown_no_default_key_mappings=1
" set nofoldenable

" Plugin 'vim-scripts/taglist.vim'
" let Tlist_Show_One_File=1
" let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

Plugin 'majutsushi/tagbar'
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumbers = 1
" let g:tagbar_autoshowtag = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Plugin 'Lokaltog/vim-easymotion'
" let g:EasyMotion_leader_key='f'

Plugin 'fatih/vim-go'
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_build_constraints = 1

Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'

call vundle#end()

syntax on
filetype on
filetype plugin on
filetype indent on

set shiftwidth=4
set tabstop=4
set softtabstop=4

set ambiwidth=double
set autoread
set autoindent
set autowrite
set backspace=indent,eol,start
set cscopetag
set expandtab
set encoding=utf-8
set hidden             " Hide buffers when they are abandoned
set hlsearch
set ignorecase		" Do case insensitive matching
set incsearch
set lbr
set nu
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set smarttab
set smartcase		" Do smart case matching

"删除多余空格
"" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction
autocmd BufWrite *.py :call DeleteTrailingWS()

hi Pmenu    ctermfg=white  ctermbg=magenta    cterm=none 
hi PmenuSel ctermfg=white  ctermbg=lightgray  cterm=none
hi linenr   ctermfg=darkgray

autocmd FileType c setlocal path+=include

autocmd FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescript.tsx setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sass setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType vuejs setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4

set timeout ttimeoutlen=100 timeoutlen=5000

map <BS> gcc
map j gj
map k gk

let mapleader=';'
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>f :GoTestFunc<CR>
au FileType go nmap <leader>d :GoDebugStart<CR>
au FileType go nmap <c-]> gd
au FileType go nmap <c-d> :GoDoc<CR>

map <leader>C :CtrlPClearCache<CR>
map <leader>nerd<CR> :NERDTree<CR>
map <leader>tag<CR> :TagbarToggle<CR>
map <leader>w+ :vertical resize +2<CR>
map <leader>w- :vertical resize -2<CR>
map <leader>h+ :resize +2<CR>
map <leader>h- :resize -2<CR>

"tsx coloring
" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666

" hi ReactState guifg=#C176A7
" hi ReactProps guifg=#D19A66
" hi ApolloGraphQL guifg=#CB886B
" hi Events ctermfg=204 guifg=#56B6C2
" hi ReduxKeywords ctermfg=204 guifg=#C678DD
" hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
" hi WebBrowser ctermfg=204 guifg=#56B6C2
" hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
