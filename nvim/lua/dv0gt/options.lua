vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.title = true
vim.opt.foldenable = false
vim.opt.updatetime = 400
vim.opt.encoding = "UTF-8"

vim.opt.clipboard = "unnamedplus"

vim.opt.splitright = true
vim.opt.relativenumber = true

vim.opt.spell = false
vim.opt.spelllang = "en_us"
vim.opt.spellsuggest = "10"

vim.opt.cmdheight = 0

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

-- git-blame settings
vim.g.gitblame_enabled = 1
vim.g.gitblame_display_virtual_text = 0
vim.g.gitblame_date_format = "%r"
vim.g.gitblame_message_template = "<summary> • <committer-date> • <committer>"
