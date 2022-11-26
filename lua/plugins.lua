vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' 

    -- language-server
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use "mfussenegger/nvim-jdtls"
    
    -- auto-complete
    
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"

    use {
      "nvim-treesitter/nvim-treesitter",
      { run = ":TSUpdate" }
    }

    -- color-scheme
    use "rebelot/kanagawa.nvim"

    -- telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"
    use "nvim-telescope/telescope-fzy-native.nvim"
    use "nvim-telescope/telescope-dap.nvim"

    use "nvim-lua/plenary.nvim"
    use "tpope/vim-fugitive"
    use 'nvim-lualine/lualine.nvim'
    use "nvim-tree/nvim-web-devicons"
    use "akinsho/toggleterm.nvim"
    use "rafamadriz/friendly-snippets"
    use 'mfussenegger/nvim-dap'
    use "windwp/nvim-autopairs"
end)
