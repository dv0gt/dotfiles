local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local gitblame_status_ok, git_blame = pcall(require, "gitblame")
if not gitblame_status_ok then
  return
end

lualine.setup({
  sections = {
    lualine_c = {
      { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
    },
  },
})
