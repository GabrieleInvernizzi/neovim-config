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
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1


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

require('nvim-tree').setup({
    hijack_cursor = false,
    on_attach = function(bufnr)
        local bufmap = function(lhs, rhs, desc)
            vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
        end

        local api = require('nvim-tree.api')

        bufmap('o', api.node.open.edit, 'Expand directory or open file')
        bufmap('c', api.node.navigate.parent_close, 'Close parent directory')
        bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
    end
})

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>m', '<cmd>NvimTreeFocus<cr>')

require('telescope').setup()

vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

require('toggleterm').setup({
    open_mappings = '<C-g>',
    direction = 'float',
    shade_terminals = true
})

require('gitsigns').setup({
    signs = {
        add = {text = '▎'},
        change = {text = '▎'},
        delete = {text = '➤'},
        topdelete = {text = '➤'},
        changedelete = {text = '▎'},
    }
})

require('nvim-autopairs').setup({
    disable_filetype = { 'TelescopePrompt' , 'vim' },
})
