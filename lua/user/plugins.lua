local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

if packer_bootstrap then
    return
end

return require('packer').startup({function(use)
    use 'wbthomason/packer.nvim'        -- packer

    use 'lewis6991/impatient.nvim'      -- optimizer

    -- themes
    use 'navarasu/onedark.nvim'
    use 'shaunsingh/nord.nvim'

    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'numToStr/Comment.nvim'
    use 'kylechui/nvim-surround'
    use { 'akinsho/toggleterm.nvim', tag = '*' }
    use 'lewis6991/gitsigns.nvim'
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-fugitive'
    -- Telescope
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
    use "nvim-telescope/telescope-file-browser.nvim"
    use 'AckslD/nvim-neoclip.lua'
    use 'ahmedkhalf/project.nvim'
    -- cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use { 'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*' }
    use 'rafamadriz/friendly-snippets'
    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'folke/which-key.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'RRethy/vim-illuminate'
    use 'stevearc/dressing.nvim'
    use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
    use 'max397574/better-escape.nvim'

    -- Language specific
    use 'simrat39/rust-tools.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = "rounded" })
        end,
    }
}})



