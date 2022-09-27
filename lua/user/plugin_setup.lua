require('onedark').setup {
    style = 'warmer'
}

require('onedark').load()

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
        bufmap('n', api.fs.create, 'Create new file')
    end
})

require('telescope').setup()

require('toggleterm').setup({
    direction = 'float',
    shade_terminals = true,
    float_ops = { border = 'curved' }
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

require('startup').setup({ theme = 'startup_theme' })

require('which-key').setup()
