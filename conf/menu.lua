local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local M = {}

terminal = "urxvt"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor
beautiful.init("~/.config/awesome/themes/futurama/theme.lua")

myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

myappmenu = {
    { "Vivaldi", function() awful.spawn("vivaldi-stable") end},
    { "Firfox", function() awful.spawn("firefox") end},
    { "Thunar", function() awful.spawn("thunar") end},
    { "PyCharm", function() awful.spawn("pycharm") end},
    { "VS Code", function() awful.spawn("code") end},
    { "Discord", function() awful.spawn("discord") end},
    { "Spotify", function() awful.spawn("spotify") end},
    { "Joplin", function() awful.spawn("joplin-desktop") end}
}

M.mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "applications", myappmenu },
                                    { "open terminal", terminal }
                                  }
                        })


return M
