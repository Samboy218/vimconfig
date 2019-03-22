runtime! debian.vim


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set number
set showmatch


set backupdir=~/.vimbackup,.

syntax enable
set background=dark
colorscheme solarized

highlight Normal guifg=white guibg=black

set laststatus=2

set hidden

let mapleader="\\"

nmap <leader>T :enew<cr>
nmap <leader>n :bnext<CR>
nmap <leader>bn :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

filetype indent on

set showmatch

set incsearch
set hlsearch

nnoremap <leader><space> :nohlsearch<CR>

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
set foldenable
set foldmethod=syntax
set foldlevelstart=20
" unlimit yanking between files
:set viminfo='20,<1000,s10,h 

" Smart Tab Key
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
