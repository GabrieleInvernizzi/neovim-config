-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false 	-- check
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.showmode = false

-- Global settings
vim.g.mapleader = ' '


-- Keybindings
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'save' })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true }) 
vim.keymap.set('n', '<leader>b', '<cmd>bnext<cr>', { desc = 'go to next buffer' })


-- Require plugins
require('pmanager')


require('onedark').load()



-- Setup plugins
require('lualine').setup({
    options = {
        theme = 'onedark',
        icons_enabled = true,
        component_separators = '|',
        section_separators = ''
    }
})

require('bufferline').setup({
    options = {
        mode = 'buffers',
        offsets = {
            { filetype = 'NvimTree' }
        }
    },
    highlights = {
        buffer_selected = {
            italic = false
        },
        indicator_selected = {
            fg = { attribute = 'fg', highlight = 'Function' },
            italic = false
        }
    }
})

require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true
    },
    ensure_installed = {
        'c', 'lua'
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            },
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true
        }
    }
})

require('Comment').setup()

require('nvim-surround').setup()
