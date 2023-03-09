local hasLuaLine, lualine = pcall(require, 'lualine')

if not hasLuaLine then return end

lualine.setup({
  options = {
    theme = "powerline"
  },
})
