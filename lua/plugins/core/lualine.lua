local hasLuaLine, lualine = pcall(require, 'lualine')

if not hasLualine then
  return
end

lualine.setup
{
  options = {
    theme='powerline'
  },
  section = {
    lualine_y = {''},
    lualine_z = {'location', 'progress'},
  }
}
