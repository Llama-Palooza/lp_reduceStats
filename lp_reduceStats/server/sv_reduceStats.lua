local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('lp_stats:server:reduceStats', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if not player then return end
    local reduceChance = math.random(1,10)
    if reduceChance <= 5 then
        local hunger = player.PlayerData.metadata.hunger - Config.settings.decrease.hungerAmount
        local thirst = player.PlayerData.metadata.thirst
    
        if hunger <= 0 then
          hunger = 0
        end      
    
        if math.random(1,10) <= 5 then
            reduceThirst = true
            thirst = thirst - Config.settings.decrease.thirstAmount
            if thirst <= 0 then
                thirst = 0
            end           
        end   
    
        if reduceThirst then
            player.Functions.SetMetaData('hunger', hunger)
            player.Functions.SetMetaData('thirst', thirst)     
            TriggerClientEvent('hud:client:UpdateNeeds', src, hunger, thirst)
            reduceThirst = false
        else
            player.Functions.SetMetaData('hunger', hunger)
            TriggerClientEvent('hud:client:UpdateNeeds', src, hunger)
        end  
        if not notified then
            QBCore.Functions.Notify(src, "You're getting exhausted..", 'primary')
            notified = true
            SetTimeout(30 * 1000, function()  
                notified = false
            end)
        end 
    end
end)
