ctrl_alt_cmd = {"ctrl", "alt", "cmd"}
alt_cmd  = {"alt", "cmd"}
ctrl_alt     = {"ctrl", "alt"}

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
hs.hotkey.bind(alt_cmd, "Q", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x
    f.y = s_f.y
    f.w = s_f.w / 2
    f.h = s_f.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind(alt_cmd, "W", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x
    f.y = s_f.y
    f.w = s_f.w
    f.h = s_f.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind(alt_cmd, "E", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x + (s_f.w / 2)
    f.y = s_f.y
    f.w = s_f.w / 2
    f.h = s_f.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind(alt_cmd, "A", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x
    f.y = s_f.y
    f.w = s_f.w / 2
    f.h = s_f.h
    win:setFrame(f)
end)

hs.hotkey.bind(alt_cmd, "S", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x
    f.y = s_f.y
    f.w = s_f.w
    f.h = s_f.h
    win:setFrame(f)
end)

hs.hotkey.bind(alt_cmd, "D", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x + (s_f.w / 2)
    f.y = s_f.y
    f.w = s_f.w / 2
    f.h = s_f.h
    win:setFrame(f)
end)

hs.hotkey.bind(alt_cmd, "Z", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x
    f.y = s_f.y + (s_f.h / 2)
    f.w = s_f.w / 2
    f.h = s_f.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind(alt_cmd, "X", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x
    f.y = s_f.y + (s_f.h / 2)
    f.w = s_f.w
    f.h = s_f.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind(alt_cmd, "C", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x + (s_f.w / 2)
    f.y = s_f.y + (s_f.h / 2)
    f.w = s_f.w / 2
    f.h = s_f.h / 2
    win:setFrame(f)
end)

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
