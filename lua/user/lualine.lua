local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
    return
end


lualine.setup({
    options = {
        theme = 'nord',
        icons_enabled = true,
        component_separators = '|',
        section_separators = ''
    }
})
