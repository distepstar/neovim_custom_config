vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- handle barbar padding when nvim tree toggle
vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function(tbl)
    if vim.bo[tbl.buf].filetype == 'NvimTree' then
      require 'bufferline.api'.set_offset(31, 'FileTree')
    end
  end
})

vim.api.nvim_create_autocmd({ 'BufWinLeave', 'BufWipeout' }, {
  callback = function(tbl)
    if vim.bo[tbl.buf].filetype == 'NvimTree' then
      require 'bufferline.api'.set_offset(0)
    end
  end
})
require('nvim-tree').setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
