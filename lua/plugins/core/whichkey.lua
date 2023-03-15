local hasWk, wk = pcall(require, 'which-key')
local hasBuiltin, builtin = pcall(require, 'telescope.builtin')

if not hasWk then
  return
end

if not hasBuiltin then
  return
end

wk.register({
  -- Buffers
  c = { ":BufferClose<cr>", "Close current buffer" },
  -- NvimTree
  e = { ":NvimTreeToggle<cr>", "Toggle Nvim Tree File Explorer" },
  r = { ":NvimTreeRefresh<cr>", "Refresh Nvim Tree File Explorer" },
  n = { ":NvimTreeFindFile<cr>", "Find File in Nvim Tree File Explorer" },
  -- Telescope
  f = {
    name = "Telescope",
    f = { builtin.find_files, "Telescope find file" },
    g = { builtin.live_grep, "Telescope live grep" },
    b = { builtin.buffers, "Telescope find buffers" },
    h = { builtin.help_tags, "Telescope help tags" },
  },
  -- Goto
  g = {
    name = "Goto",
    D = { vim.lsp.buf.declaration, "Declaration" },
    d = { vim.lsp.buf.definition, "Definition" },
    i = { vim.lsp.buf.implementiation, "Implementation" },
  },
  -- Legendary
  k = {
    name = "Legendary",
    m    = { ":Legendary<cr>", "View all keymaps" }
  },
  -- Packer
  p = {
    name = "Packer",
    r = { ":so %<cr>", "Reload project" },
    i = { ":PackerInstall<cr>", "Packer Install" },
    u = { ":PackeUpdate<cr>", "Packer Update" },
    c = { ":PackerCompile<cr>", "Packer Compile" },
    d = { ":PackerClean<cr>", "Packer Clean" },
  },
  -- Term
  s = {
    name = "Terminal",
    t = { ":ToggleTerm<cr>", "Toggle Single Terminal" },
    T = { ":ToggleTerm ", "Toggle Number Terminal" },
    a = { ":ToggleTermToggleAll<cr>", "Toggle All Terminal" },
    s = { ":ToggleTermSendCurrentLine<cr>", "Send current line to terminal" },
  },
  q = { ":qa<cr>", "Exit" }, -- qa
  [","] = { ":nohl<CR>", "Clear search highlighting" },
}, { prefix = "<leader>", nowait = true })

wk.register({
  -- navigation
  l = { "$", "Goto end of the line" },
  h = { "^", "Goto start of the line" },
}, { prefix = "g" })
