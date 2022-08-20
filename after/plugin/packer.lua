if not start then
    vim.g.mapleader = ' '
    vim.opt.termguicolors = true
    vim.o.background = 'dark'
    vim.cmd 'colorscheme gruvbox'

    vim.cmd 'set cole=1'
    vim.cmd 'set switchbuf=usetab'
end
start = true

require('packer').startup(function()
    use { 'wbthomason/packer.nvim', requires = { 'nvim-lua/popup.nvim', 'kyazdani42/nvim-web-devicons' } }

    -- LSP
    use { 'neovim/nvim-lspconfig', requires = { '~/Git/plugin/cfg-lspconfig.nvim', 'SmiteshP/nvim-navic' } }
    use { 'onsails/lspkind-nvim', requires = '~/Git/plugin/cfg-lspkind.nvim' }
    use { 'jose-elias-alvarez/null-ls.nvim', requires = '~/Git/plugin/cfg-null-ls.nvim' }
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
            'nvim-treesitter/nvim-treesitter-textobjects',
            '~/Git/plugin/cfg-tree-sitter.nvim',
            '~/Git/plugin/cfg-tree-sitter-tweek.nvim',
        },
    }
    use { 'David-Kunz/treesitter-unit' }
    use { 'lewis6991/spellsitter.nvim' }

    -- nvim-cmp
    use { 'hrsh7th/nvim-cmp', requires = '~/Git/plugin/cfg-cmp.nvim' }
    use { 'L3MON4D3/LuaSnip', requires = '~/Git/plugin/cfg-luasnip.nvim' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'hrsh7th/cmp-emoji' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-path' }
    use { 'octaltree/cmp-look' }
    use { 'f3fora/cmp-spell' }

    -- dap
    use { 'mfussenegger/nvim-dap', requires = { '~/Git/plugin/cfg-dap.nvim', '~/Git/plugin/cfg-c-dap.nvim' } }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'theHamsta/nvim-dap-virtual-text' }
    use { 'leoluz/nvim-dap-go' }

    -- plugin

    use { 'kylechui/nvim-surround', requires = '~/Git/plugin/cfg-surround.nvim' }
    use { 'windwp/nvim-autopairs', requires = '~/Git/plugin/cfg-autopair.nvim' }
    use { 'numToStr/Comment.nvim', requires = '~/Git/plugin/cfg-comment.nvim' }
    use { 'kevinhwang91/nvim-hlslens', requires = '~/Git/plugin/cfg-hlslens.nvim' }

    -- git
    use { 'sindrets/diffview.nvim', require = '~/Git/plugin/cfg-diffview.nvim' }
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
    use { 'luukvbaal/nnn.nvim', requires = '~/Git/plugin/cfg-nnn.nvim' }
    use { 'voldikss/vim-floaterm' }
    use { 'static-nvim/mkdir' }
    use { 'fedepujol/move.nvim' }

    -- Theme
    use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'nvim-lualine/lualine.nvim', requires = '~/Git/plugin/cfg-statusline.nvim' }
    use { 'norcalli/nvim-colorizer.lua' }
    use { 'tjdevries/colorbuddy.nvim' }
    use { 'ellisonleao/gruvbox.nvim' }

    -- config
    use { '~/Git/plugin/cfg-autocmd.nvim' }
    use { '~/Git/plugin/cfg-set-setting.nvim' }
    use { '~/Git/plugin/cfg-keymaping.nvim' }
    use { '~/Git/plugin/cfg-test' }
    use { '~/Git/plugin/cfg-toglle_terminal.nvim' }
    use { '~/Git/plugin/cfg-highlight.nvim' }

    use { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' }
    use { 'ggandor/leap.nvim' }
end)

-- vim.cmd [[autocmd BufWritePost init.lua source <afile> | PackerCompile]]
