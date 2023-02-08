--[[
    MOVE WINDOWS

    Move windows to other displays or desktops
--]]

function move_window_to_display(display_id)
    return function()
        local win = hs.window.focusedWindow()
        local displays = hs.screen.allScreens()
        win:moveToScreen(displays[display_id], false, true)
    end
end

function move_main_window_to_space(space_id)
    return function()
        local win = hs.window.focusedWindow()
        local screen_uuid = hs.screen.mainScreen():getUUID()
        local spaces = hs.spaces.allSpaces()[screen_uuid]
        hs.spaces.moveWindowToSpace(win, spaces[space_id])
    end
end

function move_window_to_space(window, space_id)
    return function()
        local screen_uuid = hs.screen.mainScreen():getUUID()
        local spaces = hs.spaces.allSpaces()[screen_uuid]
        hs.spaces.moveWindowToSpace(window, spaces[space_id])
    end
end
