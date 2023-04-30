
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)


function RandomItem()
  return Config.item[math.random(#Config.item)]
end

function RandomNumber()
	return math.random(2,6)
end


RegisterNetEvent('giveitem:poubelle')
AddEventHandler('giveitem:poubelle', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  math.randomseed(GetGameTimer())
  xPlayer.addInventoryItem(RandomItem(), RandomNumber())
end)


