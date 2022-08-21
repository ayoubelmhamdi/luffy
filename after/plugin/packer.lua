

require('packer').startup(function()
    use { 'wbthomason/packer.nvim', requires = { 'nvim-lua/popup.nvim', 'kyazdani42/nvim-web-devicons' } }

    -- LSP
    use { 'neovim/nvim-lspconfig', requires = { 'SmiteshP/nvim-navic' } }
    use { 'onsails/lspkind-nvim' }
    use { 'jose-elias-alvarez/null-ls.nvim' }
    use { 'akinsho/flutter-tools.nvim' }
    use { 'glepnir/lspsaga.nvim' }
    use { 'ray-x/lsp_signature.nvim' }

    -- telescope
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- tree-Sitter: "nvim-treesitter/nvim-treesitter"
    use {
        -- 'thmsmlr/nvim-treesitter',
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects'

        },
    }
    use { 'David-Kunz/treesitter-unit' }
    use { 'lewis6991/spellsitter.nvim' }

    -- nvim-cmp
    use { 'hrsh7th/nvim-cmp' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'hrsh7th/cmp-emoji' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-path' }
    use { 'octaltree/cmp-look' }
    use { 'f3fora/cmp-spell' }

    -- dap
    use { 'mfussenegger/nvim-dap' }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'theHamsta/nvim-dap-virtual-text' }
    use { 'leoluz/nvim-dap-go' }

    -- plugin

    use { 'kylechui/nvim-surround' }
    use { 'windwp/nvim-autopairs' }
    use { 'numToStr/Comment.nvim' }
    use { 'kevinhwang91/nvim-hlslens' }

    -- git
    use { 'sindrets/diffview.nvim' }
    use { 'TimUntersberger/neogit' }
    use { 'lewis6991/gitsigns.nvim' }
    use { 'airblade/vim-rooter' }

    -- Misc
    use '907th/vim-auto-save' -- auto save files like dart
    use { 'tjdevries/train.nvim' }
    -- use { 'phaazon/hop.nvim' }
    use { 'folke/todo-comments.nvim' }
    -- startup imprevment to be speed
    use { 'lewis6991/impatient.nvim' }

    -- Explorer & Terminal
    use { 'luukvbaal/nnn.nvim' }
    use { 'voldikss/vim-floaterm' }
    use { 'static-nvim/mkdir' }
    use { 'fedepujol/move.nvim' }

    -- Theme
    use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'nvim-lualine/lualine.nvim' }
    use { 'norcalli/nvim-colorizer.lua' }
    use { 'tjdevries/colorbuddy.nvim' }
    use { 'ellisonleao/gruvbox.nvim' }

    use { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' }
    use { 'ggandor/leap.nvim' }
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
end)
vim.cmd [[autocmd BufWritePost packer source <afile> | PackerCompile]]
