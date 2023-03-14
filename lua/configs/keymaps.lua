local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Indent fix on insert
vim.cmd [[function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()]]


-- Change leader to a comma
vim.g.mapleader = ' '

-- Neovim shortcuts
-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to kk
map('i', 'jj', '<Esc>')
map('i', 'kk', '<Esc>')

-- Move block of code top down
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "J", ":move '>+1<CR>gv-gv")

-- Move block of code left right
map("", ">", ":><cr>gv-gv")
map("", "<", ":<<cr>gv-gv")

map('t', '<Esc>', '<C-\\><C-n>')
-- Buffers
map('n', '<S-l>', ':BufferNext<cr>')
map('n', '<S-h>', ':BufferPrevious<cr>')

map('n', '<F2>', ':set invpaste paste?<CR>') -- Toggle auto-indenting for code paste
vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Better yank
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")


-- Kakoune like keymaps
map('x', '<S-v>', 'j') -- select multiple line below in x mode
