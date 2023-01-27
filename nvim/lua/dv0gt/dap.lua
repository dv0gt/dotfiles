local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_vscode_status_ok, dap_vscode = pcall(require, "dap-vscode-js")
if not dap_vscode_status_ok then
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

-- go lang debugger
dap_go.setup()

-- js/ts debugger
dap_vscode.setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

-- -- java debugger
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

vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#FF3131', ctermbg = 0 })
vim.api.nvim_set_hl(0, 'DapBg', { bg = '#000000', ctermbg = 0 })
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBg' })

vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#0FFF50', ctermbg = 0 })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapBg' })

-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dap_ui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dap_ui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dap_ui.close()
-- end
