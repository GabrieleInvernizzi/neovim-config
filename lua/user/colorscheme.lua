local status_ok, nord = pcall(require, "nord")

vim.g.nord_contrast = true
vim.g.nord_italic = false

if status_ok then
    nord.set()
else
    vim.cmd[[colorscheme default]]
end
