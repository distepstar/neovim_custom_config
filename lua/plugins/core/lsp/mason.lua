local mason = require("mason")
local masonlsp = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

mason.setup()
masonlsp.setup()

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- navic
  if client.server_capabilities['documentSymbolProvider']then
    require('nvim-navic').attach(client, bufnr)
  end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  require("which-key").register({
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
      f = { function() vim.lsp.buf.format { async = true } end, "Format" },
    }
  }, { prefix = "<leader>" })
end

masonlsp.setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    lspconfig[server_name].setup {}
  end,
  -- handler for specific language server
  -- E.g. rust_analyzer
  -- ["rust_analyzer"] = function ()
  --     require("rust-tools").setup {}
  -- end
}

local servers = masonlsp.get_installed_servers()
local lsp_flags = {
  debounce_text_changes = 100,
}


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
  }
end
