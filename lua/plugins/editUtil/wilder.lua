local wilder = require('wilder')
-- minimal configuration


-- ui config
wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlights = {
      border = "Normal",
    },
    border = "rounded",
  })
))

wilder.setup({ modes = { ':', '/', '?' } })
