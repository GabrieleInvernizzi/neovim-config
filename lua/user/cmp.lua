
table.unpack = table.unpack or unpack -- 5.1 compatibility

-- TODO: add pcall

require('luasnip.loaders.from_vscode').lazy_load()

local has_words_before = function()
    local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

local select_opts = { behavior = cmp.SelectBehavior.Select } cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = {'kind', 'abbr', 'menu'},
        format = lspkind.cmp_format({
            mode = 'symbol',
            symbol_map = {
                Array = "",
                Boolean = "⊨",
                Class = "",
                Constructor = "",
                Key = "",
                Namespace = "",
                Null = "NULL",
                Number = "#",
                Object = "⦿",
                Package = "",
                Property = "",
                Reference = "",
                Snippet = "",
                String = "𝓐",
                TypeParameter = "",
                Unit = "",
            },
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snip]",
            }),
            maxwidth = 50,
            ellipsis_char = '...'
        })
    },
    mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        ['<C-e>'] = cmp.mapping.abort(),

        ['<CR>'] = cmp.mapping.confirm({select = true}),

        ['<C-d>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, {'i', 's'}),

        ['<C-b>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {'i', 's'}),

        ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expandable() then
                            luasnip.expand()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
                        local col = vim.fn.col('.') - 1

                        if cmp.visible() then
                            cmp.select_next_item(select_opts)
                        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                            fallback()
                        else
                            cmp.complete()
                        end
                    end, {'i', 's'})
    }
})


local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})


vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})


vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
)

-- Command cmp
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    },
    {
      { name = 'cmdline' }
    })
})

for _,v in pairs({ '/', '?' }) do
    cmp.setup.cmdline(v, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
end

