Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand('co', function(source, args, rawCommand)
 local ped = PlayerPedId()
 local coordsPed = GetEntityCoords(ped)
 print(coordsPed)
end, false)

RegisterCommand('spawnpoubelle', function(source, args, rawCommand)
 local ped = PlayerPedId()
 local coordsPed = GetEntityCoords(ped)
 local object = "prop_ld_rub_binbag_01"


 CreateObject(object, coordsPed.x, coordsPed.y, coordsPed.z, false, false, true)

end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        local pedCoords = GetEntityCoords(PlayerPedId())
        local objectId =GetClosestObjectOfType(pedCoords, 3.0, GetHashKey("prop_ld_rub_binbag_01"), false)

  if DoesEntityExist(objectId) then
ESX.ShowHelpNotification('Appuyer sur ~g~E ~w~pour fouiller la poubelle')
        end


    end
end)