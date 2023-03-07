local g = vim.g
local opt = vim.opt

-- colorscheme
g.material_style = "deep ocean"
vim.cmd 'colorscheme material'
-- General
opt.mouse = 'a' -- enable mouse
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.completeopt = 'menuone,noinsert,noselect'

-- UI
opt.relativenumber = true -- Show line number
opt.showmatch = true      -- Highlight matching parenthesis
opt.foldmethod = 'marker' -- Enable folding (default 'foldmarker')
opt.splitright = true     -- Vertical split to the right
opt.splitbelow = true     -- Horizontal split to the bottom
opt.ignorecase = true     -- Ignore case letters when search
opt.smartcase = true      -- Ignore lowercase for the whole pattern
opt.linebreak = true      -- Wrap on word boundary
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.laststatus = 3        -- Set global statusline

-- Tab, indent
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- Memory, CPU
opt.hidden = true     -- Enable background buffers
opt.history = 100     -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240   -- Max column for syntax highlight
opt.updatetime = 300    -- ms to wait for trigger an event


-- -- Disable builtin plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end
