
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local myglobal = require("conf.global")


local M = {}

terminal = myglobal.terminal
editor = myglobal.editor
editor_cmd = terminal .. " -e " .. editor
beautiful.init(myglobal.theme)

myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

function parsedir(directory)
    local pfile = io.popen("/usr/bin/ls -1 --file-type "..directory)

    local items = {}

    for filename in pfile:lines() do
        print(filename)
        if string.sub(filename,-1,-1) == "/" then
            filename = string.sub(filename,1,-2)
            table.insert(items, {filename, parsedir(directory..'/'..string.gsub(filename," ", "\\ "))})
        elseif string.sub(filename,-1,-1) == "@" or string.sub(filename,-1,-1) == "*" then
            filename = string.sub(filename,1,-2)
            table.insert(items, {filename, function() awful.spawn.with_shell(directory.."/"..string.gsub(filename," ", "\\ ")) end})
        end
    end
    pfile:close()
    return items
end


menu_items = parsedir("~/.config/awesome/conf/menus")
table.insert(menu_items, 1, { "awesome", myawesomemenu, beautiful.awesome_icon })
table.insert(menu_items, { "open terminal", terminal })
M.mymainmenu = awful.menu({items = menu_items })


return M

