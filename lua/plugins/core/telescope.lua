local hasTelescope, telescope = pcall(require, 'telescope')

if not hasTelescope then
  return
end

telescope.setup {
  defaults = {
    layout_config = {
      vertical = { width = 0.5 }
    }
  },
  pickers = {
    theme = 'dropdown'
  },
}
