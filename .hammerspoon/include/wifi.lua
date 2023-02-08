function show_wifi_info()
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
end
