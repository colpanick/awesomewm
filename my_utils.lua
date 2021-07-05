#!/usr/bin/lua5.3

local M = {}

channel = "Capture"

function M.get_mic_state()

    amixer_output = io.popen("amixer get " .. channel)
    mic_status = amixer_output:read("*a") 
    amixer_output:close()
    mic_state = string.match(mic_status, "%[(o..?)]")
    return mic_state
end

function M.toggle_mic()
    amixer_output = io.popen("amixer set " .. channel .. " toggle")
    output = amixer_output:read("*a")
    amixer_output:close()
    return string.match(output, "%[(o..?)]")
end

print(M.toggle_mic())

return M
    

