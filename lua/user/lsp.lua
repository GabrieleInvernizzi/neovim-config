-- TODO: add pcall
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'sumneko_lua', 'rust-analyzer' }
})

local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = function(_, _)
        vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
    end
}

local lsp_config = require('lspconfig')

lsp_config.util.default_config = vim.tbl_deep_extend(
    'force',
    lsp_config.util.default_config,
    lsp_defaults
)


lsp_config.sumneko_lua.setup({
    single_file_support = true,
    on_attach = lsp_defaults.on_attach
})


local rt = require('rust-tools')

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            lsp_defaults.on_attach(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy"
            },
            inlayHints = {
                closureReturnTypeHints = "with_block"
            }
        }
    },
})

