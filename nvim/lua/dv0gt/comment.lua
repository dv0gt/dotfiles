local comment_status_ok, comment = pcall(require, "Comment")
if not comment_status_ok then
  return
end

comment.setup({
  toggler = {
    ---Line-comment toggle keymap
    line = "gcc",
    ---Block-comment toggle keymap
    block = "gcb",
  },
})
