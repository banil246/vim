set nocompatible
set tabstop=2 shiftwidth=2 softtabstop=0
set expandtab
set autoindent 
set number
filetype plugin indent off


command! Indent2 :setlocal tabstop=2 shiftwidth=2
command! Indent4 :setlocal tabstop=4 shiftwidth=4

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/neosnippet.vim'
    NeoBundle "Shougo/neosnippet-snippets"
    NeoBundle 'Townk/vim-autoclose'
    NeoBundle 'mattn/emmet-vim'
    NeoBundle 'Shougo/neocomplete'
    NeoBundle 'derekwyatt/vim-scala'

  call neobundle#end()
endif 

if neobundle#is_installed('neocomplete')
    " neocomplete用設定
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 0
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
    inoremap <expr><CR>   pumvisible() ? "\<C-n>" . neocomplete#close_popup()  : "<CR>"
    inoremap <expr><C-e> neocomplete#cancel_popup()

    let $VIMHOME = $HOME . '/.vim'
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'ruby' : $VIMHOME.'/dict/ruby.dict',
        \ 'php'  : $VIMHOME.'/dict/php.dict',
        \ 'javascript' : $VIMHOME.'/dict/javascript.dict',
        \ 'scala' : $VIMHOME.'/dict/scala.dict',
        \ 'java' : $VIMHOME.'/dict/java.dict'
        \ }

endif

"keymap"
" Plugin key-mappings.  " <C-k>でsnippetの展開 "
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

let g:user_emmet_settings = {
  \ 'lang': 'ja'
  \ }

set splitbelow
set splitright
set nobackup
set textwidth=0 
set backspace=indent,eol,start 
set showmode 
set noswapfile
set clipboard+=unnamed
set timeout timeoutlen=1000 ttimeoutlen=10
set ruler

syn on
filetype plugin indent on
NeoBundleCheck

