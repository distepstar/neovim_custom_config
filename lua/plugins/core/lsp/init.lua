local hasMason, mason = pcall(require, "plugins/core/lsp/mason")
local hasCmp, cmp = pcall(require, "plugins/core/lsp/cmp")
local hasLspSignature, lspsignature = pcall(require, "plugins/core/lsp/lspsignature")
local hasTreesitter, treesitter = pcall(require, "plugins/core/lsp/treesitter")
local hasLspLines, lsplines = pcall(require, "plugins/core/lsp/lsplines")
local hasLspTrouble, lsptrouble = pcall(require, "plugins/core/lsp/lsptrouble")
local hasPrettier, prettier = pcall(require, "plugins/core/lsp/prettier")

if not hasMason then return end
if not hasCmp then return end
if not hasLspSignature then return end
if not hasTreesitter then return end
if not hasLspLines then return end
if not hasLspTrouble then return end
if not hasPrettier then return end
