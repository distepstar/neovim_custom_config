local mason = require("mason")              -- mason
local masonlsp = require("mason-lspconfig") -- mason-lspconfig
local wk = require("which-key")             -- whick-key
local null_ls = require("null-ls")          -- null-ls
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

mason.setup()
masonlsp.setup()

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- navic
  if client.server_capabilities['documentSymbolProvider'] then
    require('nvim-navic').attach(client, bufnr)
  end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  wk.register({
    l = {
      name = "Lsp",
      g = {
        name = "Goto",
        D = { vim.lsp.buf.declaration, "Declaration" },
        d = { vim.lsp.buf.definition, "Definition" },
        i = { vim.lsp.buf.implementiation, "Implementation" },
      },
      s = { vim.lsp.buf.signature_help, "Signature Help" },
      w = {
        name = "Workspace",
        a = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
        r = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
        l = {
          function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end
          , "Remove Workspace Folder" },
      },
      D = { vim.lsp.buf.type_definition, "Type Definition" },
      n = { vim.lsp.buf.rename, "Rename" },
      a = { vim.lsp.buf.code_action, "Code Action" },
      r = { vim.lsp.buf.references, "Reference" },
    }
  }, { prefix = "<leader>" })

  if client.supports_method("textDocument/formatting") then
    wk.register({
      l = {
        f = {
          function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          end, "Format"
        }
      }
    }, { prefix = "<leader>" })


    -- format on save
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, async = async })
      end,
      desc = "[lsp] format on save",
    })
  end
  if client.supports_method("textDocument/rangeFormatting") then
    wk.register({
      l = {
        f = {
          function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          end, "Format"
        }
      }
    }, { mode = "x", prefix = "<leader>" })
  end
end

local servers = masonlsp.get_installed_servers()
local lsp_flags = {
  debounce_text_changes = 100,
}

masonlsp.setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    lspconfig[server_name].setup {

      on_attach = on_attach,
      capabilities = capabilities,
      flags = lsp_flags,
    }
  end,
  -- handler for specific language server
  -- E.g. rust_analyzer
  -- ["rust_analyzer"] = function ()
  --     require("rust-tools").setup {}
  -- end
}


-- null_ls
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.luacheck,
    -- format
    null_ls.builtins.formatting.prettier,
  },
})
