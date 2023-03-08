local lspsignature = require "lsp_signature"

local cfg = {
  bind = true,
  handler_opts = {
    border = "rounded"
  }

} -- add configs here

lspsignature.setup(cfg)
