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


for i , pos in ipairs(Config.position) do
    local object = "prop_bin_07c"
    CreateObject(object, pos.x, pos.y, pos.z, false, false, true)

end 

function PoubelleOpen() 
  for i , pos in ipairs(Config.position) do
      local object2 = Config.props2
      CreateObject(object2, pos.x, pos.y, pos.z, false, false, true)  
    end 
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        local pedCoords = GetEntityCoords(PlayerPedId())
        local objectId =GetClosestObjectOfType(pedCoords, Config.Distance, Config.props, false)
        local objectId2 =GetClosestObjectOfType(pedCoords, Config.Distance, Config.props2, false)
 
        if DoesEntityExist(objectId)then
        FreezeEntityPosition(objectId, true)
ESX.ShowHelpNotification('Appuyer sur ~g~E ~w~pour fouiller la poubelle')
if IsControlJustPressed(1, 51) then
  Wait(2000)
  TriggerServerEvent("giveitem:poubelle")
--[[   ESX.ShowNotification("Vous venez de trouver ~g~ x3 ~w~ bière !") ]]
  DeleteObject(objectId)
  PoubelleOpen() 




--[[       RequestAnimDict("exile_2_int-21")
            while not HasAnimDictLoaded("exile_2_int-21") do  
               Wait(1)
            end
            TaskPlayAnim(GetPlayerPed(-1), "exile_2_int-21", "prop_cs_rub_binbag_01-21", 1.0, -1.0, 5000, 0, 1, true, true, true) ]] 
          end 

        end
    

    end
end)