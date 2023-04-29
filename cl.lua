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
      local object2 = "prop_bin_07d"
      CreateObject(object2, pos.x, pos.y, pos.z, false, false, true)
        FreezeEntityPosition(object2, true)
  end 
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        local pedCoords = GetEntityCoords(PlayerPedId())
        local objectId =GetClosestObjectOfType(pedCoords, Config.Distance, Config.props, false)
        local objectId2 =GetClosestObjectOfType(pedCoords, Config.Distance, Config.props2, false)
 
        if DoesEntityExist(objectId) then
        FreezeEntityPosition(objectId, true)
ESX.ShowHelpNotification('Appuyer sur ~g~E ~w~pour fouiller la poubelle')
if IsControlJustPressed(1, 51) then
  Wait(2000)
  ESX.ShowNotification("Vous venez de trouver ~g~ x3 ~w~ bière !")
  DeleteObject(objectId)
  PoubelleOpen() 

 


--[[        RequestAnimDict("missfbi4prepp1")
            while not HasAnimDictLoaded("missfbi4prepp1") do  
               Wait(1)
            end
            TaskPlayAnim(GetPlayerPed(-1), "missfbi4prepp1", "_idle_garbage_man", 1.0, -1.0, 5000, 0, 1, true, true, true) ]] 
          end 

        end
    

    end
end)