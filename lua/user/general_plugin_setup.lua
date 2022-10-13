local status_ok, plugin = pcall(require, "nvim-surround")

if status_ok then
    plugin.setup()
end


status_ok, plugin = pcall(require, "nvim-autopairs")

if status_ok then
    plugin.setup({
        disable_filetype = { 'TelescopePrompt', 'vim' },
    })
end


status_ok, plugin = pcall(require, "Comment")

if status_ok then
    plugin.setup()
end


status_ok, plugin = pcall(require, "which-key")

if status_ok then
    plugin.setup()
end


status_ok, plugin = pcall(require, "colorizer")

if status_ok then
    plugin.setup()
end


status_ok, plugin = pcall(require, "dressing")

if status_ok then
    plugin.setup()
end


status_ok, plugin = pcall(require, "better_escape")

if status_ok then
    plugin.setup()
end

