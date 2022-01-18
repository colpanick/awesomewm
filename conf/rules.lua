local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

local myglobal = require("conf.global")
local mykeys = require("conf.keys")
local mybuttons = require("conf.buttons")

M = {}


M.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = mykeys.clientkeys,
                     buttons = mybuttons.clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     titlebars_enabled = true,
                     
     }
    },
    -- No titlebars
    {
        rule_any = {
            class = {
                "URxvt",
                "Eog" -- Eye of Gnome image viewer (Already has buttons)
            }
        },
        properties = { titlebars_enabled = false }
    },

    {
        rule = {class="Wfica"},
        properties = {
            tag = "1",
            screen =1,
            maximized = true,
        }

    },
    {
        rule = {class="Joplin"},
        properties = {
            tag = "2-notes",
            screen = 2,
        }
    },
    {
        rule_any = {
            name = {
                "Spotify",
                "Spotify Premium",
            },
            class = {
                "spotify",
                "Spotify",
            }
        },
        properties = {
            tag = "8-music",
            screen = 2,
            floating = true,
            titlebars_enabled = false,
        }
    },
    {
        rule = {class="discord"},
        properties = {
            tag = screen[2].tags[7]
        }
    },
    {
        rule = {name="Enpass"},
        except = {name="Enpass Assistant"},
        properties = {
            tag = "9-pw",
            screen = 2,
        }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer",
          "Gimp-2.10",
          "Gnome-calculator",
      },


        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
--          "browser-window",
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true, titlebars_enabled = true }},

    -- Add titlebars to normal clients and dialogs
    --{ rule_any = {type = { "normal", "dialog" }
    --  }, properties = { titlebars_enabled = false }
    --},

}


return M