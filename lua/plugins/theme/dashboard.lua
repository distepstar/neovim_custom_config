require('dashboard').setup {
  config = {
    theme = 'hyper',
    week_header = {
      enable = true,
    },
    shortcut = {
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' Mason',
        group = 'Plugins',
        action = 'Mason',
        key = 'm',
      },
    },
  }
}
