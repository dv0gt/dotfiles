vim.g.mapleader = " "

vim.keymap.set("n", "x", '"_x', { silent = true })
vim.keymap.set("v", "p", "P", { silent = true }) -- capital P does not yank selection, make this the default behavior
vim.keymap.set("n", "<A-o>", ':<C-u>call append(line("."), "")<CR>', { silent = true })
vim.keymap.set("n", "<A-O>", ':<C-u>call append(line(".")-1, "")<CR>', { silent = true })

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
     { "", group = "Global Leader", nowait = true, remap = false },
     { "<Leader>b", group = "buffer", nowait = true, remap = false },
     { "<Leader>ba", ":%bd|e#|bd#<cr>", desc = "delete all buffers but this", nowait = true, remap = false },
     { "<Leader>bb", ":Telescope buffers<cr>", desc = "show open buffers", nowait = true, remap = false },
     { "<Leader>bd", ":bd<cr>", desc = "delete single buffer", nowait = true, remap = false },
     { "<Leader>cD", ":lua vim.lsp.buf.declaration()<CR>", desc = "Goto declaration", nowait = true, remap = false },
     { "<Leader>cR", ":lua vim.lsp.buf.references()<CR>", desc = "Find references", nowait = true, remap = false },
     { "<Leader>cd", ":lua vim.lsp.buf.definition()<CR>", desc = "Goto definition", nowait = true, remap = false },
     { "<Leader>cf", ":lua vim.lsp.buf.format { async = true }<CR>", desc = "Format", nowait = true, remap = false },
     { "<Leader>ci", ":lua vim.lsp.buf.implementation()<CR>", desc = "Goto impl", nowait = true, remap = false },
     { "<Leader>cm", ":MarkdownPreview<CR>", desc = "Markdown preview", nowait = true, remap = false },
     { "<Leader>cr", ":Lspsaga rename<CR>", desc = "Rename", nowait = true, remap = false },
     { "<Leader>db", ":lua require'dap'.toggle_breakpoint()<cr>", desc = "toggle breakpoint", nowait = true, remap = false },
     { "<Leader>di", ":lua require'dap'.step_into()<cr>", desc = "step into", nowait = true, remap = false },
     { "<Leader>do", ":lua require'dap'.step_over()<cr>", desc = "step over", nowait = true, remap = false },
     { "<Leader>ds", ":lua require'dap'.continue()<cr>", desc = "start/continue", nowait = true, remap = false },
     { "<Leader>dt", ":lua require'dapui'.toggle()<cr>", desc = "ui", nowait = true, remap = false },
     { "<Leader>e", ":NvimTreeToggle<cr>", desc = "Explorer", nowait = true, remap = false },
     { "<Leader>ff", ":Telescope find_files hidden=true<cr>", desc = "find files in workspace", nowait = true, remap = false },
     { "<Leader>fg", ":Telescope live_grep<cr>", desc = "find in files in workspace", nowait = true, remap = false },
     { "<Leader>ft", ":TodoLocList<cr>", desc = "show todo list", nowait = true, remap = false },
     { "<Leader>gc", ":GitBlameCopySHA<CR>", desc = "Copy commit sha", nowait = true, remap = false },
     { "<Leader>gg", ":lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit", nowait = true, remap = false },
     { "<Leader>gu", ":GitBlameCopyCommitURL<CR>", desc = "Copy commit url", nowait = true, remap = false },
     { "<Leader>hm", ":lua require'harpoon.mark'.add_file()<CR>", desc = "Harpoon mark file", nowait = true, remap = false },
     { "<Leader>hp", ":lua require'harpoon.ui'.toggle_quick_menu()<CR>", desc = "Harpoon toggle ui", nowait = true, remap = false },
     { "<Leader>ia", ":Lspsaga code_action<CR>", desc = "Code action", nowait = true, remap = false },
     { "<Leader>ih", ":Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics", nowait = true, remap = false },
     { "<Leader>ij", ":lua vim.diagnostic.goto_prev({buffer=0})<CR>", desc = "Goto next", nowait = true, remap = false },
     { "<Leader>ik", ":lua vim.diagnostic.goto_next({buffer=0})<CR>", desc = "Goto previous", nowait = true, remap = false },
     { "<Leader>is", ":Lspsaga signature_help<CR>", desc = "Signature help", nowait = true, remap = false },
     { "<Leader>t", group = "test", nowait = true, remap = false },
     { "<Leader>uu", ':r !uuidgen|tr "[A-Z]" "[a-z]"<CR>', desc = "Generate uuid", nowait = true, remap = false },
     { "<leader>c", group = "code", nowait = true, remap = false },
     { "<leader>d", group = "debug", nowait = true, remap = false },
     { "<leader>f", group = "find", nowait = true, remap = false },
     { "<leader>g", group = "git", nowait = true, remap = false },
     { "<leader>h", group = "harpoon", nowait = true, remap = false },
     { "<leader>i", group = "diagnostics", nowait = true, remap = false },
     { "<leader>u", group = "util", nowait = true, remap = false },
     { "<leader>w", group = "window", nowait = true, remap = false },
     { "<leader>wh", "<C-w>s<CR>", desc = "Split ↓", nowait = true, remap = false },
     { "<leader>wv", "<C-w>v<CR>", desc = "Split →", nowait = true, remap = false },
}

local control_mappings = {
    { "", group = "Global Control", nowait = true, remap = false },
    { "<C-c>", "ESC", desc = "escape bind", nowait = true, remap = false },
    { "<C-h>", ":wincmd h<cr>", desc = "move buffer focus left", nowait = true, remap = false },
    { "<C-j>", ":wincmd j<cr>", desc = "move buffer focus down", nowait = true, remap = false },
    { "<C-k>", ":wincmd k<cr>", desc = "move buffer focus up", nowait = true, remap = false },
    { "<C-l>", ":wincmd l<cr>", desc = "move buffer focus right", nowait = true, remap = false },
}

local shift_mappings = {
    { "", group = "Global shift", nowait = true, remap = false },
    { "<S-h>", ":bp<CR>", desc = "go to previous buffer", nowait = true, remap = false },
    { "<S-l>", ":bn<CR>", desc = "go to next buffer", nowait = true, remap = false },
}

local single_mappings = {
    { "", group = "Global Single", nowait = true, remap = false },
    { "<Down>", ":resize -5<cr>", desc = "resize + horizontal", nowait = true, remap = false },
    { "<Left>", ":vertical resize -5<cr>", desc = "resize - vertical", nowait = true, remap = false },
    { "<Right>", ":vertical resize +5<cr>", desc = "resize - vertical", nowait = true, remap = false },
    { "<Up>", ":resize +5<cr>", desc = "resize - horizontal", nowait = true, remap = false },
    { "q", ":quit<cr>", desc = "quit", nowait = true, remap = false },
}

which_key.add(leader_mappings, opts)
which_key.add(control_mappings, opts)
which_key.add(shift_mappings, opts)
which_key.add(single_mappings, opts)
