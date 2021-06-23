function! s:init_minpac() abort
    packadd minpac

    call minpac#init()
    call minpac#add('k-takata/minpac', { 'type': 'opt' })

    for package in [
        \ 'joshdick/onedark.vim',
        \ 'neoclide/coc.nvim',
        \ 'sheerun/vim-polyglot',
        \ 'tpope/vim-commentary',
        \ 'tpope/vim-fugitive',
        \ 'vim-airline/vim-airline',
        \ 'ryanoasis/vim-devicons',
        \ ]
        call minpac#add(package)
    endfor
endfunction

command PackUpdate call s:init_minpac() | call minpac#update()
command PackClean  call s:init_minpac() | call minpac#clean()

let coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-deno',
    \ 'coc-explorer',
    \ 'coc-git',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ ]

if index(getcompletion('', 'color'), 'onedark') != -1
    let onedark_hide_endofbuffer = 1
    let onedark_terminal_italics = 1
    augroup colorscheme
        autocmd!
        autocmd ColorScheme * call onedark#extend_highlight('Function', { 'gui': 'bold' })
        autocmd ColorScheme * call onedark#extend_highlight('jsFuncCall', { 'gui': 'bold' })
    augroup END
    colorscheme onedark
end

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . ' ' . expand('<cword>')
    endif
endfunction

function! s:init()
    if exists('g:did_coc_loaded')
        if has('nvim-0.5.0')
            set signcolumn=number
        else
            set signcolumn=yes
        end

        command Format call CocAction('format')
        command Fold   call CocAction('fold')

        augroup coc
            autocmd!
            autocmd CursorHold *                  silent call CocActionAsync('highlight')
            autocmd User       CocJumpPlaceholder        call CocActionAsync('showSignatureHelp')
        augroup END

        highlight link CocHighlightText Visual
        highlight link CocGitChangedSign DiffText
        
        inoremap <silent>        <expr> <Tab>     pumvisible() ? coc#_select_confirm() : "\<Tab>"
        inoremap <silent>        <expr> <CR>      pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

        nnoremap <silent>               K         :call <SID>show_documentation()<CR>
        
        nmap     <silent>               gd        <Plug>(coc-definition)
        nmap     <silent>               gi        <Plug>(coc-implementation)
        nmap     <silent>               gr        <Plug>(coc-references)
        nmap     <silent>               gt        <Plug>(coc-type-definition)

        nmap     <silent>               [d        <Plug>(coc-diagnostic-prev)
        nmap     <silent>               ]d        <Plug>(coc-diagnostic-next)

        nmap     <silent>               <C-s>     <Plug>(coc-range-select)
        xmap     <silent>               <C-s>     <Plug>(coc-range-select)

        nmap                            <Leader>a <Plug>(coc-codeaction-selected)
        xmap                            <Leader>a <Plug>(coc-codeaction-selected)
        nmap                            <Leader>f <Plug>(coc-format-selected)
        xmap                            <Leader>f <Plug>(coc-format-selected)
        nmap                            <Leader>r <Plug>(coc-rename)

        nnoremap <silent><nowait>       <Space>b  :CocList buffers<CR>
        nnoremap <silent><nowait>       <Space>c  :CocList commands<CR>
        nnoremap <silent><nowait>       <Space>d  :CocList diagnostics<CR>
        nnoremap <silent><nowait>       <Space>e  :CocCommand explorer<CR>
        nnoremap <silent><nowait>       <Space>f  :CocList files<CR>
        nnoremap <silent><nowait>       <Space>g  :CocList grep<CR>
        nnoremap <silent><nowait>       <Space>l  :CocList -I --ignore-case lines<CR>
        nnoremap <silent><nowait>       <Space>o  :CocList outline<CR>
        nnoremap <silent><nowait>       <Space>r  :CocListResume<CR>
        nnoremap <silent><nowait>       <Space>s  :CocList symbols<CR>

        nnoremap <silent><nowait><expr> <C-b>     coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        inoremap <silent><nowait><expr> <C-b>     coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
        vnoremap <silent><nowait><expr> <C-b>     coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        nnoremap <silent><nowait><expr> <C-f>     coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        inoremap <silent><nowait><expr> <C-f>     coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
        vnoremap <silent><nowait><expr> <C-f>     coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    end

    if exists('g:loaded_airline')
        set noshowmode
    endif
endfunction

if v:vim_did_enter
    call s:init()
else
    autocmd VimEnter * call s:init()
end

augroup cursorline
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

set cursorline
set expandtab tabstop=4
set hidden
set ignorecase smartcase
set mouse=a
set nowrap
set number relativenumber
set shortmess+=c
set termguicolors
