local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "dv0gt.lsp.lsp-installer"
require("dv0gt.lsp.handlers").setup()
require "dv0gt.lsp.null-ls"
