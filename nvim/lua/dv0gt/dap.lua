local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end


local status_ok, dap_go = pcall(require, "dap-go")
if not status_ok then
  return
end


local ui_status_ok, dap_ui = pcall(require, "dapui")
if not ui_status_ok then
  return
end

-- golang
dap_go.setup()

-- java debugger
dap.configurations.java = {
  {
    type = 'java';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5005;
  },
}

dap_ui.setup()

vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#9d2f03', ctermbg = 0 })
vim.api.nvim_set_hl(0, 'DapBreakpointBg', { bg = '#9d2f03', ctermbg = 0 })
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpointBg' })

vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#e5e500', ctermbg = 0 })
vim.api.nvim_set_hl(0, 'DapStoppedBg', { bg = '#e5e500', ctermbg = 0 })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStoppedBg' })

-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dap_ui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dap_ui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dap_ui.close()
-- end
