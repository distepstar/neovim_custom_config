-- packer
require('plugins')
-- impatient
require('impatient')

-- configuration
require('configs/keymaps')
require('configs/autocmds')
require('configs/options')

-- core config
require('plugins/core/bufferline') -- barbar
require('plugins/core/lualine')    -- lualine
require('plugins/core/nvim-tree')  -- nvim-tree
require('plugins/core/legendary')  -- legendary
require('plugins/core/telescope')  -- telescope
require('plugins/core/dressing')   -- dressing
require('plugins/core/whichkey')   -- whichkey

-- edit support
require('plugins/editUtil/lastplace') -- lastplace
require('plugins/editUtil/hlslens')   -- hlslens

-- animation
require('plugins/animation/cursorline') -- cursorline

-- theme
require('plugins/theme/material')
