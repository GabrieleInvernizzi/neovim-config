
local status_ok, tt = pcall(require, "toggleterm")

if not status_ok then
    return
end

tt.setup({
    open_mapping = [[<c-\>]],
    direction = 'float',
    shade_terminals = false,
    float_ops = {
        border = 'curved',
        winblend = 20
    }
})
