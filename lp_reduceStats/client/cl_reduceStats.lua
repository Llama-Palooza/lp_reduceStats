local function reduceStats()    
    CreateThread(function()
        local player = PlayerPedId()
        local wait = Config.settings.interval
        while logged do
            if (IsPedSprinting(player) or IsPedSwimming(player) or GetPlayerSprintStaminaRemaining(PlayerId()) > Config.settings.staminaAmount) then
                TriggerServerEvent('lp_stats:server:reduceStats', source)
            end
            Wait(wait)
        end
    end)
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Wait(3000)
    logged = true
    reduceStats()  
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    logged = false
end)