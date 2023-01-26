vim.g.mapleader = " "

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
local leader_mappings = {
  name = "Global Leader",
  ["<leader>f"] = { name = "+find" },
  ["<Leader>ff"] = { ":Telescope find_files hidden=true<cr>", "find files in workspace" },
  ["<Leader>fg"] = { ":Telescope live_grep<cr>", "find in files in workspace" },
  ["<Leader>fb"] = { ":Telescope buffers<cr>", "show open buffers" },
  ["<Leader>e"] = { ":NvimTreeToggle<cr>", "Explorer" },
  ["<leader>d"] = { name = "+debug" },
  ["<Leader>db"] = { ":lua require'dap'.toggle_breakpoint()<cr>", "toggle breakpoint" },
  ["<Leader>ds"] = { ":lua require'dap'.continue()<cr>", "start debugger" },
  ["<Leader>di"] = { ":lua require'dap'.step_into()<cr>", "step into" },
  ["<Leader>do"] = { ":lua require'dap'.step_over()<cr>", "step over" },
  -- harpoon
  ["<leader>h"] = { name = "+harpoon" },
  -- code
  ["<leader>c"] = { name = "+code" },
  ["<Leader>cs"] = { ":Lspsaga signature_help<CR>", "Show code signature" },
  ["<Leader>cr"] = { ":Lspsaga rename<CR>", "Rename" },
  ["<Leader>ch"] = { ":Lspsaga show_line_diagnostics<CR>", "Show line diagnostics" },
  ["<Leader>cd"] = { ":lua vim.lsp.buf.definition()<CR>", "Goto definition" },
  -- util
  ["<leader>u"] = { name = "+util" },
  ["<Leader>uu"] = { ":r !uuidgen|tr \"[A-Z]\" \"[a-z]\"<CR>", "generate uuid" },
  -- git
  ["<leader>g"] = { name = "+git" },
}

local control_mappings = {
  name = "Global Control",
  ["<C-c>"] = { "ESC", "escape bind" },
  ["<C-k>"] = { ":wincmd k<cr>", "move buffer focus up" },
  ["<C-j>"] = { ":wincmd j<cr>", "move buffer focus down" },
  ["<C-h>"] = { ":wincmd h<cr>", "move buffer focus left" },
  ["<C-l>"] = { ":wincmd l<cr>", "move buffer focus right" },
}

local shift_mappings = {
  name = "Global shift",
  ["<S-h>"] = { ":bp<CR>", "go to previous buffer" },
  ["<S-l>"] = { ":bn<CR>", "go to next buffer" },
}

local single_mappings = {
  name = "Global Single",
  ["q"] = { ":quit<cr>", "quit" },
  ["<Left>"] = { ":vertical resize -5<cr>", "resize - vertical" },
  ["<Right>"] = { ":vertical resize +5<cr>", "resize - vertical" },
  ["<Up>"] = { ":resize +5<cr>", "resize - horizontal" },
  ["<Down>"] = { ":resize -5<cr>", "resize + horizontal" },
}

which_key.register(leader_mappings, opts)
which_key.register(control_mappings, opts)
which_key.register(shift_mappings, opts)
which_key.register(single_mappings, opts)
