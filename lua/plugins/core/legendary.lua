local hasLegendary, legendary = pcall(require, 'legendary')

if not hasLegendary then
  return
end

legendary.setup({
  which_key = {
    auto_register = true

  },
  require('dressing').setup({
    select = {
      get_config = function(opts)
        if opts.kind == 'legendary.nvim' then
          return {
            telescope = {
              sorter = require('telescope.sorters').fuzzy_with_index_bias({})
            }
          }
        else
          return {}
        end
      end
    }
  })
})
