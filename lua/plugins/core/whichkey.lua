local hasWk, wk = pcall(require, 'which-key')
local hasBuiltin, builtin = pcall(require, 'telescope.builtin')

if not hasWk then
  return
end

if not hasBuiltin then
  return
end

wk.register({
  -- core utils
  -- Packer
  p = {
    name = "Packer",
    r = { ":so %<cr>", "Reload project" },
    i = { ":PackerInstall<cr>", "Packer Install" },
    u = { ":PackeUpdate<cr>", "Packer Update" },
    c = { ":PackerCompile<cr>", "Packer Compile" },
    d = { ":PackerClean<cr>", "Packer Clean" },
  },
  -- Legendary
  k = {
    name = "Legendary",
    m    = { ":Legendary<cr>", "View all keymaps" }
  },
  -- Telescope
  f = {
    name = "Telescope",
    f = { builtin.find_files, "Telescope find file" },
    g = { builtin.live_grep, "Telescope live grep" },
    b = { builtin.buffers, "Telescope find buffers" },
    h = { builtin.help_tags, "Telescope help tags" },
  },
  -- NvimTree
  e = { ":NvimTreeToggle<cr>", "Toggle Nvim Tree File Explorer" },
  r = { ":NvimTreeRefresh<cr>", "Refresh Nvim Tree File Explorer" },
  n = { ":NvimTreeFindFile<cr>", "Find File in Nvim Tree File Explorer" },
  -- Term
  t = { ":Term<cr>", "Open terminal in new split window" },
  -- Buffers
  c = { ":BufferClose<cr>", "Close current buffer" },
  q = { ":qa<cr>", "Exit" },
      [","] = { ":nohl<CR>", "Clear search highlighting" },
}, { prefix = "<leader>", nowait = true })

wk.register({
  l = { "$", "Goto end of the line" },
  h = { "^", "Goto start of the line" },
}, { prefix = "g" })
