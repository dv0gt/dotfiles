local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    { "", group = "Harpoon", nowait = true, remap = false },
    { "<S-TAB>", ":lua require'harpoon.ui'.nav_prev()<CR>", desc = "Harpoon move prev file", nowait = true, remap = false },
    { "<TAB>", ":lua require'harpoon.ui'.nav_next()<CR>", desc = "Harpoon move next file", nowait = true, remap = false },
}

which_key.add(mappings, opts)
