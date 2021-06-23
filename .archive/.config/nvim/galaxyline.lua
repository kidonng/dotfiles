local galaxyline = require 'galaxyline'
local condition = require 'galaxyline.condition'
local icons = require 'nvim-nonicons'

local modes = {
    c = {
        text = icons.get 'vim-command-mode' .. '  ',
    },
    i = {
        text = icons.get 'vim-insert-mode' .. '  ',
        highlight = 'guifg=' .. vim.g.colors.blue.gui,
    },
    n = {
        text = icons.get 'vim-normal-mode' .. '  ',
        highlight = 'guifg=' .. vim.g.colors.green.gui,
    },
    R = {
        text = icons.get 'vim-replace-mode' .. '  ',
        highlight = 'guifg=' .. vim.g.colors.red.gui,
    },
    s = {
        text = icons.get 'vim-select-mode' .. '  ',
        highlight = 'guifg=' .. vim.g.colors.purple.gui,
    },
    S = {
        text = icons.get 'vim-select-mode' .. ' ' .. icons.get 'dash',
        highlight = 'guifg=' .. vim.g.colors.purple.gui,
    },
    [''] = {
        text = icons.get 'vim-select-mode' .. ' ' .. icons.get 'rectangle',
        highlight = 'guifg=' .. vim.g.colors.purple.gui,
    },
    t = {
        text = icons.get 'vim-terminal-mode' .. '  ',
    },
    v = {
        text = icons.get 'vim-visual-mode' .. '  ',
        highlight = 'guifg=' .. vim.g.colors.purple.gui,
    },
    V = {
        text = icons.get 'vim-visual-mode' .. ' ' .. icons.get 'dash',
        highlight = 'guifg=' .. vim.g.colors.purple.gui,
    },
    [''] = {
        text = icons.get 'vim-visual-mode' .. ' ' .. icons.get 'rectangle',
        highlight = 'guifg=' .. vim.g.colors.purple.gui,
    },
}

galaxyline.section.left[1] = {
    Mode = {
        provider = function()
            local mode = vim.fn.mode()

            if modes[mode] ~= nil then
                local highlight = modes[mode].highlight

                if highlight ~= nil then
                    vim.api.nvim_command('highlight GalaxyMode ' .. highlight)
                end
                return modes[mode].text
            else
                vim.api.nvim_command 'highlight link GalaxyMode Normal'
                return mode
            end
        end,
        separator = '  ',
    }
}

galaxyline.section.left[2] = {
    Name = {
        provider = function()
            local mode = vim.fn.mode()

            if modes[mode] ~= nil then
                local highlight = modes[mode].highlight

                if highlight ~= nil then
                    vim.api.nvim_command('highlight GalaxyName ' .. highlight .. ' gui=bold')
                end
            else
                vim.api.nvim_command 'highlight link GalaxyName Normal'
            end

            local name = vim.fn.expand '%:t'

            return name
        end,
        separator = ' ',
    }
}

galaxyline.section.left[3] = {
    Modified = {
        provider = function()
            if vim.bo.modified then
                return icons.get 'pencil' .. ' '
            end
        end,
    }
}

galaxyline.section.left[4] = {
    Readonly = {
        provider = function()
            if vim.bo.readonly == true then
                if vim.bo.filetype == 'help' then
                    return icons.get 'question'
                end

                return icons.get 'lock'
            end
        end,
    }
}

galaxyline.section.right[1] = {
    Icon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
    }
}

galaxyline.section.right[2] = {
    Type = {
        provider = function()
            return vim.bo.filetype
        end,
    }
}

galaxyline.section.right[3] = {
    Branch = {
        provider = 'GitBranch',
        icon = '  ' .. icons.get 'git-branch' .. ' '
    }
}
