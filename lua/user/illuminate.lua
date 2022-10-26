local status_ok, ill = pcall(require, "illuminate")

if not status_ok then
    return
end

ill.configure({
    filetypes_denylist = {
       "fugitive",
       "NvimTree",
       "alpha",
       "packer",
       "toggleterm",
       "DressingSelect",
       "TelescopePrompt"
    }
})

local highlight = {
   bg = "#434C5E"
}

vim.api.nvim_set_hl(0, "IlluminatedWordText", highlight)
vim.api.nvim_set_hl(0, "IlluminatedWordRead", highlight)
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", highlight)

