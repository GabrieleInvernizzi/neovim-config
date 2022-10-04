-- General keymaps
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>b', '<cmd>bnext<cr>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<leader>q', '<cmd>bd<cr>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
-- Move lines and selections
vim.keymap.set('n', '<M-k>', '<cmd>m -2<cr>==', { desc = 'Move line up' })
vim.keymap.set('n', '<M-j>', '<cmd>m +1<cr>==', { desc = 'Move line down' })
vim.keymap.set('v', '<M-k>', "<cmd>m '>-2<cr>gv=gv", { desc = 'Move line up' })
vim.keymap.set('v', '<M-j>', "<cmd>m '<+1<cr>gv=gv", { desc = 'Move line down' })

-- Remap change split keymaps
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Move in insert
vim.keymap.set('i', '<C-h>', '<left>')
vim.keymap.set('i', '<C-j>', '<down>')
vim.keymap.set('i', '<C-k>', '<up>')
vim.keymap.set('i', '<C-l>', '<right>')

-- NvimTree keymaps
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>m', '<cmd>NvimTreeFocus<cr>')

-- Telescope keymaps
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fe', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
vim.keymap.set('n', '<leader>fn', '<cmd>Telescope neoclip<cr>')

-- Session keymaps
vim.keymap.set('n', '<leader>sl', '<cmd>SessionManager load_session<cr>')
vim.keymap.set('n', '<leader>sll', '<cmd>SessionManager load_last_session<cr>')
vim.keymap.set('n', '<leader>ss', '<cmd>SessionManager save_current_session<cr>')
