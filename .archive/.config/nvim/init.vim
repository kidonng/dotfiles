lua << EOF
_G.init_packer = function()
require 'packer'.startup(function()
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require 'bufferline'.setup {
                options = {
                    diagnostics = 'nvim_lsp',
                    diagnostics_indicator = function(count) return ' ' .. count end
                }
            }
        end
    }
    use 'b3nj5m1n/kommentary'
    use 'dstein64/nvim-scrollview'
    use {
        'folke/tokyonight.nvim',
        config = function()
            if vim.env.THEME == 'light' then
                vim.o.background = 'light'
            end

            vim.cmd 'colorscheme tokyonight'
        end
    }
    use {
        'folke/which-key.nvim',
        config = function()
            require 'which-key'.setup {}
        end
    }
    use {
        'hoob3rt/lualine.nvim',
        config = function()
            require 'lualine'.setup {
                options = {
                    section_separators = '',
                    theme = 'tokyonight'
                },
                sections = {
                    lualine_c = {{ 'diagnostics', sources = { 'nvim_lsp' } }},
                    lualine_x = {},
                    lualine_y = {},
                }
            }

            vim.cmd 'set noshowmode'
        end
    }
    use {
        'hrsh7th/nvim-compe',
        config = function()
            require 'compe'.setup {
                source = {
                    buffer = true,
                    nvim_lsp = true,
                    path = true,
                    tabnine = true,
                },
            }

            local options = { noremap = true, expr = true }
            vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', options)
            vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', options)
        end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            local sign = { text = '▌'}
            require 'gitsigns'.setup {
                signs = {
                    add = sign,
                    change = sign,
                    delete = sign,
                    topdelete = sign,
                    changedelete = sign,
                }
            }
        end
    }
    use {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require 'lspconfig'
            local util = require 'lspconfig/util'

            local on_attach = function(client, bufnr)
                if client.resolved_capabilities.document_highlight then
                    vim.api.nvim_exec([[
                        augroup lsp_document_highlight
                            autocmd! * <buffer>
                            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                        augroup END
                    ]], false)
                end
            end

            for _, server in ipairs {
                'cssls',
                'html',
            } do
                lspconfig[server].setup { on_attach = on_attach }
            end

            -- https://github.com/neovim/nvim-lspconfig/issues/260#issuecomment-748397677
            lspconfig.tsserver.setup {
                on_attach = on_attach,
                root_dir = function(fname)
                    return util.root_pattern('tsconfig.json')(fname) or
                    util.root_pattern('package.json', 'jsconfig.json', '.git')(fname) or
                    vim.loop.cwd()
                end
            }

            vim.cmd[[
                sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError
                sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint
            ]]
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
        },
        config = function()
            require 'telescope'.load_extension 'fzf'

            for key, picker in pairs {
                b = 'buffers',
                d = 'lsp_document_diagnostics',
                D = 'lsp_workspace_diagnostics',
                f = 'find_files',
                gb = 'git_branches',
                gc = 'git_bcommits',
                gC = 'git_commits',
                gs = 'git_status',
                G = 'live_grep',
                s = 'lsp_document_symbols',
                S = 'lsp_dynamic_workspace_symbols',
            } do
                vim.api.nvim_set_keymap('n', '<Space>' .. key, "<Cmd>lua require 'telescope.builtin'." ..picker .. '()<CR>', { noremap = true })
            end

            vim.cmd 'autocmd User TelescopePreviewerLoaded setlocal wrap'
        end
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                autopairs = { enable = true },
                ensure_installed = {
                    'css',
                    'fish',
                    'html',
                    'javascript',
                    'json',
                    'jsonc',
                    'tsx',
                    'typescript',
                    'vue',
                },
                highlight = { enable = true },
                incremental_selection = { enable = true },
                indent = { enable = true }
            }
        end
    }
    use 'tpope/vim-surround'
    -- Run ~/.local/share/nvim/site/pack/packer/start/compe-tabnine/install.sh
    use 'tzachar/compe-tabnine'
    use {
        'sheerun/vim-polyglot',
        config = function()
            vim.g.vim_markdown_fenced_languages = {
                'css',
                'html',
                'js=javascript',
                'sh',
                'ts=typescript',
                'tsx=typescriptreact',
            }
        end
    }
    use { 'wbthomason/packer.nvim', opt = true }
    use {
        'windwp/nvim-autopairs',
        config = function()
            local autopairs = require 'nvim-autopairs'
            local rule = require 'nvim-autopairs.rule'
            local config = { 'template_string' }
            local condition = require 'nvim-autopairs.ts-conds'.is_ts_node(config)

            autopairs.setup {
                check_ts = true,
                ts_config = {
                    javascript = config,
                    typescript = config,
                    typescriptreact = config,
                }
            }
            autopairs.add_rules {
                -- https://github.com/windwp/nvim-autopairs/issues/45#issuecomment-837590495
                rule(' ', ' '):with_pair(function(opts)
                    return vim.tbl_contains({ '()', '[]', '{}' }, opts.line:sub(opts.col, opts.col + 1))
                end),
                rule('${', '}', 'javascript'):with_pair(condition),
                rule('${', '}', 'typescript'):with_pair(condition),
                rule('${', '}', 'typescriptreact'):with_pair(condition),
            }

            vim.api.nvim_set_keymap('i', '<CR>', "luaeval(\"require 'nvim-autopairs'.autopairs_cr()\")", { noremap = true, expr = true })
        end
    }
end)
end
EOF

command! PackerSync packadd packer.nvim | call v:lua.init_packer() | PackerSync

aug cursorline
    au WinEnter * set cursorline
    au WinLeave * set nocursorline
aug END

set completeopt=menuone,noselect
set confirm
set cursorline
set expandtab tabstop=4
set foldmethod=expr foldexpr=nvim_treesitter#foldexpr() nofoldenable
set hidden
set ignorecase smartcase
set mouse=a
set nowrap
set shortmess+=c
set signcolumn=yes
set undofile undolevels=100 undoreload=1000

noremap Y "+y
