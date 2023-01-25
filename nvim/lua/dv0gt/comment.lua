local comment_status_ok, comment = pcall(require, "Comment")
if not comment_status_ok then
  return
end

comment.setup({
  toggler = {
    ---Line-comment toggle keymap
    line = '<leader>gc',
    ---Block-comment toggle keymap
    block = '<leader>gb',
  },
})
