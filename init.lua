-- packer
require('plugins')
-- impatient
require('impatient')

-- configuration
require('configs/keymaps')
require('configs/autocmds')
require('configs/options')

-- core config
-- lsp config
require('plugins/core/lsp')        -- lsp
require('plugins/core/nvim-tree')  -- nvim-tree
require('plugins/core/bufferline') -- barbar
require('plugins/core/lualine')    -- lualine
require('plugins/core/legendary')  -- legendary
require('plugins/core/telescope')  -- telescope
require('plugins/core/dressing')   -- dressing
require('plugins/core/whichkey')   -- whichkey
require('plugins/core/toggleterm')   -- whichkey

-- git
require('plugins/core/vgit')   -- git

-- edit support
require('plugins/editUtil/lastplace') -- lastplace
require('plugins/editUtil/hop')       -- hop
require('plugins/editUtil/hlslens')   -- hlslens
require('plugins/editUtil/blankline') -- blankline

-- animation
require('plugins/animation/cursorline') -- cursorline

-- theme
require('plugins/theme/material')
require('plugins/theme/dashboard')

