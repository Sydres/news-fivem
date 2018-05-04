function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

RegisterServerEvent("news:sv")
AddEventHandler("news:sv", function (msg, msg2)
    TriggerClientEvent("SendNews", -1, msg, msg2)
end)

AddEventHandler('chatMessage', function(source, name, msg)
	local command = stringsplit(msg, " ")[1];
	
	if command == "/news" then
        CancelEvent()
        TriggerClientEvent("news:Send", source, string.sub(msg, 7))
	end
end)
