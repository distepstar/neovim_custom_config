local hasPacker, packer = pcall(require, 'packer')

if not hasPacker then
  return
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Performance
  use 'lewis6991/impatient.nvim' -- impatient
  use {                          -- better-escape
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }
  use 'antoinemadec/FixCursorHold.nvim'

  -- core utilities
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
    config = function()
      require('dashboard').setup {
        config = {
          theme = 'hyper',
          week_header = {
            enable = true,
          },
        }
      }
    end,
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use { -- which-key
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  }

  -- edit support
  use { 'kevinhwang91/nvim-hlslens' }
  use { -- autopairs
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'ethanholz/nvim-lastplace' -- lastplace
  use {                          -- yanky
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
  -- animation
  use 'yamatsum/nvim-cursorline' -- cursorline
  -- layout manage
  use({                          -- legendary, keymaps tables
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
  -- theme
  use 'marko-cerovac/material.nvim' -- materialnvim
end)
