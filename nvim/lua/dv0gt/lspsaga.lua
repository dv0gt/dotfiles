local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  return
end

lspsaga.setup({
  lightbulb = {
    enable = true,
    enable_in_insert = false,
    sign = false,
    sign_priority = 40,
    virtual_text = false,
  },
  -- remove the breadcrumb, otherwise the nvim extensions in vscode is annoying to use!
  symbol_in_winbar = {
    enable = false,
  },
})
