local hasPacker, packer = pcall(require, 'packer')

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return packer.startup(function(use)
  ------------ Packer ------------
  use 'wbthomason/packer.nvim'
  if packer_bootstrap then
    require('packer').sync()
  end
  ------------ Packer ------------


  ------------ LSP Configs ------------
  use 'neovim/nvim-lspconfig'    -- lspconfig
  use "ray-x/lsp_signature.nvim" -- lsp_signature
  use 'onsails/lspkind.nvim'     -- lspkind


  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  use { -- lsp error hints
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  }
  use { -- lsp error hints
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
    end
  }
  -- mason
  use "williamboman/mason.nvim"           -- language server installer
  use "williamboman/mason-lspconfig.nvim" -- mason-lspconfig
  -- cmp
  use 'hrsh7th/nvim-cmp'                  -- cmp for autocompletion
  use 'hrsh7th/cmp-nvim-lsp'              -- cmplsp
  -- snippets
  use 'saadparwaiz1/cmp_luasnip'          -- snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip'                  -- snippet plug
  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  } -- nvim-treesitter
  ------------ LSP Configs ------------

  ------------ Performance ------------
  use 'lewis6991/impatient.nvim' -- impatient
  use 'antoinemadec/FixCursorHold.nvim'
  ------------ Performance ------------


  ------------ Core Utilities ------------
  use 'nvim-tree/nvim-web-devicons' -- webdevicon
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag =
    'nightly'                                                                                    -- optional, updated every week. (see issue #1193)
  }                                                                                              -- nvim tree
  use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }                                   -- barbar
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } } -- lualine
  use {                                                                                          -- dashboard
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use { -- which-key
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 200
    end
  }
  -- git
  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  ------------ Core Utilities ------------


  ------------ Edit Support ------------
  use { "max397574/better-escape.nvim" }
  use { 'gelguy/wilder.nvim' }
  use { 'kevinhwang91/nvim-hlslens' }   -- better highlight for search results
  use 'mg979/vim-visual-multi'          -- multi-cursor
  use "rktjmp/highlight-current-n.nvim" -- highlighter for current search
  use({
    --barbecue
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("barbecue").setup({
        create_autocmd = false,
        attach_navic = false,
      })
    end,
  })
  use {            -- motion
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
  }
  use {            -- autopairs
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'ethanholz/nvim-lastplace'            -- lastplace
  use "lukas-reineke/indent-blankline.nvim" -- indent blankline
  use {                                     -- yanky
    'gbprod/yanky.nvim',
    config = function()
      require("yanky").setup()
    end
  }
  use { -- comment
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use { "akinsho/toggleterm.nvim", tag = '*' }
  ------------ Edit Support ------------


  ------------ Animation ------------
  use 'yamatsum/nvim-cursorline' -- cursorline
  ------------ Animation ------------


  ------------ Layout ------------
  use { -- code window
    'gorbit99/codewindow.nvim',
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
  }
  use({ -- legendary, keymaps tables
    'mrjones2014/legendary.nvim',
    -- sqlite is only needed if you want to use frecency sorting
    -- requires = 'kkharji/sqlite.lua'
  })
  use { 'stevearc/dressing.nvim' } -- dressing
  use {                            -- telescope and plenary
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  ------------ Layout ------------

  ------------ Theme ------------
  use 'marko-cerovac/material.nvim' -- materialnvim
  ------------ Theme ------------
end)
