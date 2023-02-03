--[[
    PUSH WINDOWS

    Push a single window to the full screen, a half of the screen, or to a
    corener of the screen. The idea is to map these keys to screen. Ex. 'Q' is
    the top left key so it moves the window to the top left corner.

     Q  W  E
     A  S  D
     Z  X  C
--]]
function push_top_left()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x
    f.y = s_f.y
    f.w = s_f.w / 2
    f.h = s_f.h / 2
    win:setFrame(f)
end

function push_top_half()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x
    f.y = s_f.y
    f.w = s_f.w
    f.h = s_f.h / 2
    win:setFrame(f)
end

function push_top_right()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x + (s_f.w / 2)
    f.y = s_f.y
    f.w = s_f.w / 2
    f.h = s_f.h / 2
    win:setFrame(f)
end

function push_left_half()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x
    f.y = s_f.y
    f.w = s_f.w / 2
    f.h = s_f.h
    win:setFrame(f)
end

function push_full_screen()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x
    f.y = s_f.y
    f.w = s_f.w
    f.h = s_f.h
    win:setFrame(f)
end

function push_right_half()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x + (s_f.w / 2)
    f.y = s_f.y
    f.w = s_f.w / 2
    f.h = s_f.h
    win:setFrame(f)
end

function push_bottom_left()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x
    f.y = s_f.y + (s_f.h / 2)
    f.w = s_f.w / 2
    f.h = s_f.h / 2
    win:setFrame(f)
end

function push_bottom_half()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x
    f.y = s_f.y + (s_f.h / 2)
    f.w = s_f.w
    f.h = s_f.h / 2
    win:setFrame(f)
end

function push_bottom_right()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local s_f = screen:frame()

    f.x = s_f.x + (s_f.w / 2)
    f.y = s_f.y + (s_f.h / 2)
    f.w = s_f.w / 2
    f.h = s_f.h / 2
    win:setFrame(f)
end
