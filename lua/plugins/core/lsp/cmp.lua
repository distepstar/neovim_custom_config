-- luasnip setup
local luasnip = require 'luasnip'
-- lspkind
local lspkind = require 'lspkind'

-- nvim-cmp setup
local cmp = require 'cmp'

local tab_key = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    fallback()
  end
end, { 'i', 's' })


local stab_key = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end, { 'i', 's' })

cmp.setup {
  completion = {
    autocomplete = false
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = tab_key,
    ['<S-Tab>'] = stab_key,
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = "...",
      before = function(entry, vim_item)
        return vim_item
      end
    })
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'vsnip' },
    { name = 'luasnip' },
    { name = 'buffer' }
  }),
}


-- debounce
vim.cmd([[
  augroup CmpDebounceAuGroup
    au!
    au TextChangedI * lua require("utils.debounce").debounce()
  augroup end
]])
--
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(), -- important!
--   sources = cmp.config.sources({
--     { name = 'nvim_lua' },
--     { name = 'cmdline' },
--   }),
-- })
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'buffer' }
--   })
-- })
