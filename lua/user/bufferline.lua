local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
    return
end

-- Nord colorscheme
local s_ok, nord = pcall(require, "nord")

if not s_ok then
    return
end

local highlights = nord.bufferline.highlights({
    italic = false,
    bold = true,
    fill = "#181c24"
})

bufferline.setup({
    options = {
        mode = 'buffers',
        offsets = {
            { filetype = 'NvimTree' }
        }
    },
    highlights = highlights
})

