local status_ok, transparent = pcall(require, "transparent")
if not status_ok then
  return
end

transparent.setup({
  -- groups = {
  --   "Normal NormalNC Comment Constant Special Identifier Statement PreProc Type Underlined Todo String Function Conditional Repeat Operator Structure LineNr NonText SignColumn CursorLineNr
  -- },
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude_groups = {
    "NonText",
  }, -- table: groups you don't want to clear
})
