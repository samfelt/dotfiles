require "include/modifiers"
require "include/push_window"
require "include/nudge_window"
require "include/move_window"
require "include/wifi"
require "include/app_watcher"

-- vim-like Nudge keys
--[[
    H J K L
--]]
hs.hotkey.bind(alt_cmd, "H", nudge_left)
hs.hotkey.bind(alt_cmd, "J", nudge_down)
hs.hotkey.bind(alt_cmd, "K", nudge_up)
hs.hotkey.bind(alt_cmd, "L", nudge_right)

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

-- Move windows to displays
hs.hotkey.bind(ctrl_alt_cmd, "1", move_window_to_display(1))
hs.hotkey.bind(ctrl_alt_cmd, "2", move_window_to_display(2))
hs.hotkey.bind(ctrl_alt_cmd, "3", move_window_to_display(3))
hs.hotkey.bind(ctrl_alt_cmd, "4", move_window_to_display(4))

-- Move windows to other spaces(desktops)
hs.hotkey.bind(alt_cmd, "1", move_main_window_to_space(1))
hs.hotkey.bind(alt_cmd, "2", move_main_window_to_space(2))
hs.hotkey.bind(alt_cmd, "3", move_main_window_to_space(3))

-- Show current wifi and VPN info
hs.hotkey.bind(ctrl_alt_cmd, "W", show_wifi_info)

-- Watcher
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

