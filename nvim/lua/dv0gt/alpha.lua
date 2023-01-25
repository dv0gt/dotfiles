local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
local function footer()
  return [[
 ________  ________  ________  ________  _______   ________  ___  ________  _________  _______              ________  _______   ___  ________   ________         
|\   __  \|\   __  \|\   __  \|\   __  \|\  ___ \ |\   ____\|\  \|\   __  \|\___   ___\\  ___ \            |\   __  \|\  ___ \ |\  \|\   ___  \|\   ____\        
\ \  \|\  \ \  \|\  \ \  \|\  \ \  \|\  \ \   __/|\ \  \___|\ \  \ \  \|\  \|___ \  \_\ \   __/|           \ \  \|\ /\ \   __/|\ \  \ \  \\ \  \ \  \___|        
 \ \   __  \ \   ____\ \   ____\ \   _  _\ \  \_|/_\ \  \    \ \  \ \   __  \   \ \  \ \ \  \_|/__          \ \   __  \ \  \_|/_\ \  \ \  \\ \  \ \  \  ___      
  \ \  \ \  \ \  \___|\ \  \___|\ \  \\  \\ \  \_|\ \ \  \____\ \  \ \  \ \  \   \ \  \ \ \  \_|\ \          \ \  \|\  \ \  \_|\ \ \  \ \  \\ \  \ \  \|\  \     
   \ \__\ \__\ \__\    \ \__\    \ \__\\ _\\ \_______\ \_______\ \__\ \__\ \__\   \ \__\ \ \_______\          \ \_______\ \_______\ \__\ \__\\ \__\ \_______\    
    \|__|\|__|\|__|     \|__|     \|__|\|__|\|_______|\|_______|\|__|\|__|\|__|    \|__|  \|_______|           \|_______|\|_______|\|__|\|__| \|__|\|_______|    
  ]]
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
