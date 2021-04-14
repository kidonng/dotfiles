call plug#begin(stdpath('data').'/plugged')
" CoenraadS.bracket-pair-colorizer-2
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
" eamodio.gitlens
Plug 'tpope/vim-fugitive'
" EditorConfig.EditorConfig
Plug 'editorconfig/editorconfig-vim'
" formulahendry.auto-close-tag
Plug 'alvan/vim-closetag'
let g:closetag_filetypes = 'html,vue,javascriptreact,typescriptreact'
" formulahendry.auto-rename-tag
Plug 'AndrewRadev/tagalong.vim'
" WakaTime.vscode-wakatime
Plug 'wakatime/vim-wakatime'
" WallabyJs.quokka-vscode
Plug 'metakirby5/codi.vim'
" zhuangtongfa.material-theme
Plug 'joshdick/onedark.vim'
" Language pack
Plug 'sheerun/vim-polyglot'
" Status
Plug 'vim-airline/vim-airline'
" Smooth scroll
Plug 'psliwka/vim-smoothie'
" Zen mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim'
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-deno', 
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-explorer',
      \ 'coc-git',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-lists',
      \ 'coc-json',
      \ 'coc-pairs',
      \ 'coc-prettier',
      \ 'coc-spell-checker',
      \ 'coc-tabnine',
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ ]
Plug 'mattn/emmet-vim'
" PKief.material-icon-theme
Plug 'ryanoasis/vim-devicons'
call plug#end()

set noshowmode
set termguicolors
colorscheme onedark

set hidden
set nowritebackup
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

set scrolloff=1
set sidescrolloff=5
set cursorline
set nowrap
set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase smartcase
set number relativenumber

" coc-explorer
nnoremap <space>e :CocCommand explorer<CR>

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use <CR> to confirm completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <Tab> to trigger completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap <C-f> and <C-b> for scroll float windows/popups
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

