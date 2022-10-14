require("user.options")
require("user.keymaps")
require("user.autocmd")
require("user.plugins")
pcall(require, "impatient")     -- Optimizer, doesn't require config
require("user.colorscheme")
require("user.lualine")
require("user.bufferline")
require("user.nvim-treesitter")
require("user.telescope")
require("user.toggleterm")
require("user.gitsigns")
require("user.alpha")
require("user.cmp")
require("user.lsp")
require("user.illuminate")
require("user.general_plugin_setup")

if vim.g.neovide then
    require("user.neovide_settings")
end

