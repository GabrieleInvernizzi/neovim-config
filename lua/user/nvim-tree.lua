
local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
    return
end

nvim_tree.setup({
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
    end,
    -- Required by project.nvim
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true
    }
})

