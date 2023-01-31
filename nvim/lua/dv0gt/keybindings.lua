vim.g.mapleader = " "

vim.keymap.set('n', 'x', '"_x', { silent = true })

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
  -- +find
  ["<leader>f"] = { name = "+find" },
  ["<Leader>ff"] = { ":Telescope find_files hidden=true<cr>", "find files in workspace" },
  ["<Leader>fg"] = { ":Telescope live_grep<cr>", "find in files in workspace" },
  ["<Leader>ft"] = { ":TodoLocList<cr>", "show todo list" },
  -- +buffers
  ["<Leader>bb"] = { ":Telescope buffers<cr>", "show open buffers" },
  -- explorer
  ["<Leader>e"] = { ":NvimTreeToggle<cr>", "Explorer" },
  -- +debug
  ["<leader>d"] = { name = "+debug" },
  ["<Leader>db"] = { ":lua require'dap'.toggle_breakpoint()<cr>", "toggle breakpoint" },
  ["<Leader>ds"] = { ":lua require'dap'.continue()<cr>", "start/continue" },
  ["<Leader>dt"] = { ":lua require'dapui'.toggle()<cr>", "ui" },
  ["<Leader>di"] = { ":lua require'dap'.step_into()<cr>", "step into" },
  ["<Leader>do"] = { ":lua require'dap'.step_over()<cr>", "step over" },
  -- +harpoon
  ["<leader>h"] = { name = "+harpoon" },
  ["<Leader>hm"] = { ":lua require'harpoon.mark'.add_file()<CR>", "Harpoon mark file" },
  ["<Leader>hp"] = { ":lua require'harpoon.ui'.toggle_quick_menu()<CR>", "Harpoon toggle ui" },
  -- +code
  ["<leader>c"] = { name = "+code" },
  ["<Leader>cf"] = { ":lua vim.lsp.buf.format { async = true }<CR>", "Format" },
  ["<Leader>cr"] = { ":Lspsaga rename<CR>", "Rename" },
  ["<Leader>cd"] = { ":lua vim.lsp.buf.definition()<CR>", "Goto definition" },
  ["<Leader>cD"] = { ":lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
  ["<Leader>ci"] = { ":lua vim.lsp.buf.implementation()<CR>", "Goto impl" },
  ["<Leader>cR"] = { ":lua vim.lsp.buf.references()<CR>", "Find references" },
  -- +diagnostics
  ["<leader>i"] = { name = "+diagnostics" },
  ["<Leader>ik"] = { ":lua vim.diagnostic.goto_next({buffer=0})<CR>", "Goto previous" },
  ["<Leader>ij"] = { ":lua vim.diagnostic.goto_prev({buffer=0})<CR>", "Goto next" },
  ["<Leader>ih"] = { ":Lspsaga show_line_diagnostics<CR>", "Show line diagnostics" },
  ["<Leader>ia"] = { ":Lspsaga code_action<CR>", "Code action" },
  ["<Leader>is"] = { ":Lspsaga signature_help<CR>", "Signature help" },
  -- +util
  ["<leader>u"] = { name = "+util" },
  ["<Leader>uu"] = { ":r !uuidgen|tr \"[A-Z]\" \"[a-z]\"<CR>", "Generate uuid" },
  -- +git
  ["<leader>g"] = { name = "+git" },
  ["<Leader>gg"] = { ":lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
  -- +window
  ["<leader>w"] = { name = "+window" },
  ["<leader>wv"] = { "<C-w>v<CR>", "Split →" },
  ["<leader>wh"] = { "<C-w>s<CR>", "Split ↓" },
  -- +test
  ["<Leader>t"] = { name = "+test" },
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
