--[[
    NUDGE WINDOWS

    Nudge a window in any direction. Don't resive it, just move it a little 
    bit.
--]]

move_increment = 10

function nudge_left()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    f.x = f.x - move_increment
    win:setFrame(f)
end

function nudge_right()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    f.x = f.x + move_increment
    win:setFrame(f)
end

function nudge_down()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    f.y = f.y + move_increment
    win:setFrame(f)
end

function nudge_up()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    f.y = f.y - move_increment
    win:setFrame(f)
end
