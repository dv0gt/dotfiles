local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local servers = {
  "angularls",
  "lua_ls",
  "cssls",
  "html",
  "ts_ls",
  "jsonls",
  "terraformls",
  "tflint",
  "gopls",
  "jdtls",
  "yamlls",
  "kotlin_language_server",
  "marksman",
  -- "lemminx"
}

mason.setup()
mason_lspconfig.setup({
  ensure_installed = servers,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("dv0gt.lsp.handlers").on_attach,
    capabilities = require("dv0gt.lsp.handlers").capabilities,
  }

  if server == "lua_ls" then
    local lua_opts = require("dv0gt.lsp.settings.lua_ls")
    opts = vim.tbl_deep_extend("force", lua_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require("dv0gt.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "html" then
    local html_opts = require("dv0gt.lsp.settings.html")
    opts = vim.tbl_deep_extend("force", html_opts, opts)
  end

  if server == "yamlls" then
    local yaml_opts = require("dv0gt.lsp.settings.yaml")
    opts = vim.tbl_deep_extend("force", yaml_opts, opts)
  end

  if server == "terraformls" then
    local terraformls_opts = require("dv0gt.lsp.settings.terraformls")
    opts = vim.tbl_deep_extend("force", terraformls_opts, opts)
  end

  if server == "jdtls" then
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
