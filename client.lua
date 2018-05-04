RegisterNetEvent("SendNews")
AddEventHandler("SendNews", function(msg, msg2)
    SendNUIMessage({
        type    = "brknews",
        enable  = true,
        message = msg,
        volume  = Config.Volume
    })
end)

RegisterNetEvent("news:Send")
AddEventHandler("news:Send", function(msg)
    for i, v in pairs(Config.EAS.Departments) do
        if msg == i then
            DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 600)
            while (UpdateOnscreenKeyboard() == 0) do
                DisableAllControlActions(0);
                Wait(0);
            end
            if (GetOnscreenKeyboardResult()) then
                msg = Config.EAS.Departments[i].name
                local msg2 = GetOnscreenKeyboardResult()
                TriggerServerEvent("news:sv", msg, msg2)
                SendNews(msg, msg2)
            end
        end
    end
end)