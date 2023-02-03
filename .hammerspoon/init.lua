require "include/modifiers"
require "include/push_windows"

-- Move a window to a display
function move_window_to_display(display_id)
    return function()
        local win = hs.window.focusedWindow()
        local displays = hs.screen.allScreens()
        win:moveToScreen(displays[display_id], false, true)
    end
end

-- vim-like movement keys
move_increment = 10
hs.hotkey.bind(alt_cmd, "H", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    f.x = f.x - move_increment
    win:setFrame(f)
end)

hs.hotkey.bind(alt_cmd, "L", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    f.x = f.x + move_increment
    win:setFrame(f)
end)

hs.hotkey.bind(alt_cmd, "J", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    f.y = f.y + move_increment
    win:setFrame(f)
end)

hs.hotkey.bind(alt_cmd, "K", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    f.y = f.y - move_increment
    win:setFrame(f)
end)

-- Push windows 
--[[
     Q  W  E
     A  S  D
     Z  X  C
--]]
hs.hotkey.bind(alt_cmd, "Q", push_top_left)
hs.hotkey.bind(alt_cmd, "W", push_top_half)
hs.hotkey.bind(alt_cmd, "E", push_top_right)
hs.hotkey.bind(alt_cmd, "A", push_left_half)
hs.hotkey.bind(alt_cmd, "S", push_full_screen)
hs.hotkey.bind(alt_cmd, "D", push_right_half)
hs.hotkey.bind(alt_cmd, "Z", push_bottom_left)
hs.hotkey.bind(alt_cmd, "X", push_bottom_half)
hs.hotkey.bind(alt_cmd, "C", push_bottom_right)

-- Push windows to display
hs.hotkey.bind(ctrl_alt_cmd, "1", move_window_to_display(1))
hs.hotkey.bind(ctrl_alt_cmd, "2", move_window_to_display(2))
hs.hotkey.bind(ctrl_alt_cmd, "3", move_window_to_display(3))

-- Show current wifi network
hs.hotkey.bind(ctrl_alt_cmd, "W", function()
    data = "Wifi:\t\t\t  "
    data = data .. hs.wifi.currentNetwork()

    interface = hs.network.primaryInterfaces()
    data = data .. "\nVPN:\t\t  "
    if interface:sub(0,2) == "en" then
        data = data .. "NOT Connected"
    elseif interface:sub(0,4) == "utun" then
        data = data .. "Connected"
    else
        data = data .. "Unsure..."
    end
    data = data .. "\nInterface:\t  "
    data = data .. interface
    hs.alert.show(data)
end)
