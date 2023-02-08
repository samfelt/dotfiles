require "include/move_window"

function applicationWatcher(name, event, app)
    if (event == hs.application.watcher.launched) then
        if (name == "Microsoft Outlook" or name == "Thunderbird") then
            hs.timer.doAfter(3, function ()
                print("======================")
                print(name)
                for k,win in pairs(app:allWindows()) do
                    print(k,win)
                    move_window_to_space(win, 2)()
                end
                print("======================")
            end)
        end
    end
end
