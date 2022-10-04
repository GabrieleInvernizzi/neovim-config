local status_ok, onedark = pcall(require, "onedark")

if status_ok then
    onedark.setup {
        style = 'warmer'
    }

    onedark.load()
else
    vim.cmd[[colorscheme default]]
end
