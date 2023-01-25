local status_ok, cloak = pcall(require, "cloak")
if not status_ok then
  return
end

cloak.setup({
  enabled = true,
  patterns = {
    {
      -- Match any file starting with '.env'.
      file_pattern = '.env*',
      -- Match an equals sign and any character after it.
      cloak_pattern = '=.+'
    },
  },
})
