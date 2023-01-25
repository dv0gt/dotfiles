local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

-- lsp-saga
-- local sagaGrp = api.nvim_create_augroup("LspSaga", {})
-- api.nvim_create_autocmd("CursorHold", {
--   command = "Lspsaga signature_help",
--   group = sagaGrp,
-- })
