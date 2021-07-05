#!/usr/bin/lua5.3
local mylayouts = require("conf.layouts")
local M = {}

lo = mylayouts.layouts

M.my_tags = {
        { 
            names = { "1", "2", "3", "4-web", "5-dev1", "6-dev2", "7", "8", "9-games" },
            layouts = {lo[1], lo[1], lo[1], lo[2], lo[2], lo[2], lo[1], lo[1], lo[1]}
        },
        { 
            names = { "1", "2-notes", "3", "4-web", "5", "6", "7-chat", "8-music", "9-pw" },
            layouts = {lo[1], lo[1], lo[1], lo[2], lo[1], lo[1], lo[1], lo[1], lo[1]}
        }
}

M.default = {
    {
        names = { "1", "2", "3", "4-web", "5-dev1", "6-dev2", "7", "8", "9" },
        layouts = {lo[1], lo[1], lo[1], lo[1], lo[1], lo[1], lo[1], lo[1], lo[1]}
    }
}
    


return M
    

