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
    
}

vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3b3f4c" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3b3f4c" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3b3f4c" })

