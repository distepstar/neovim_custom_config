local hasBlankline, blankline = pcall(require, "indent_blankline")
if not hasBlankline then return end

-- enable list
vim.opt.list = true
vim.opt.listchars:append "eol:↴"

blankline.setup({
  show_current_context = true,
  show_current_context_start = true,
})
