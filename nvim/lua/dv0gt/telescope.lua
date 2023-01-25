local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
  return
end


telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
  }
}
