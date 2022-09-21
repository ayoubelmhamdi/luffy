-- if true then
--   return
-- end
local packer = require 'packer'
local use = packer.use
packer.startup(function()
  packer.init {
    max_jobs = 4,
    display = {
      open_cmd = '84vnew [packer]',
      working_sym = '北 ',
      error_sym = '✗  ',
      done_sym = '✓  ',
      removed_sym = '  ',
      moved_sym = '-> ',
    },
    depth = 1, -- Git clone depth
    clone_timeout = 600, -- Timeout, in seconds, for git clones
  }

  use { 'wbthomason/packer.nvim', requires = { 'nvim-lua/popup.nvim', 'kyazdani42/nvim-web-devicons' } }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'folke/lua-dev.nvim',
      'kosayoda/nvim-lightbulb',
      'SmiteshP/nvim-navic',
      'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    },
  }
  use 'lewis6991/spellsitter.nvim'

  use { 'onsails/lspkind-nvim' }
  use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'ThePrimeagen/refactoring.nvim' } }
  use { 'akinsho/flutter-tools.nvim' }
  use { 'glepnir/lspsaga.nvim' }
  use { 'ray-x/lsp_signature.nvim' }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } },
  }

  -- tree-Sitter
  use {
    -- 'thmsmlr/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'p00f/nvim-ts-rainbow',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'David-Kunz/treesitter-unit',
      'lewis6991/spellsitter.nvim',
      -- 'windwp/nvim-ts-autotag',
    },
  }

  -- nvim-cmp
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'f3fora/cmp-spell' }
  -- use { 'hrsh7th/cmp-emoji' }
  -- use { 'octaltree/cmp-look' }

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
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  -- use { '~/Git/plugin/ayoubbuddy' }
  use { 'ThePrimeagen/harpoon' }
  -- use { 'antoinemadec/FixCursorHold.nvim' }
  use 'B4mbus/oxocarbon-lua.nvim'

  -- use {'shaunsingh/oxocarbon.nvim', run = './install.sh'}
  use { 'WhoIsSethDaniel/lualine-lsp-progress.nvim' }
  use { 'nvim-lua/lsp-status.nvim' }
end)

-- vim.cmd [[autocmd BufWritePost packer.lua source <afile> | PackerCompile]]
