local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

mason.setup()
mason_lspconfig.setup(
  {
    ensure_installed = { "angularls",
      "sumneko_lua",
      "cssls",
      "html",
      "tsserver",
      "jsonls",
      "terraformls",
      "tflint",
      "gopls",
      "jdtls",
      "yamlls",
      "kotlin_language_server",
      "marksman" }
  }
)
