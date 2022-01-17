-- Global Configuration Variables

local M = {}

M.theme = "~/.config/awesome/themes/futurama/theme.lua"

M.terminal = "urxvt"

M.editor = "vim"

-- Mod1 = Alt, Mod4 = Windows key
M.modkey = "Mod1" -- Alt
--M.modkey = "Mod4" -- Windows Key

M.editor_cmd = M.terminal .. " -e " .. M.editor

return M
