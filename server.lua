RLCore = nil
TriggerEvent("RLCore:GetObject",function(obj) RLCore = obj end)

RegisterServerEvent('oxy:serverPay')
AddEventHandler('oxy:serverPay', function(money)
    local src = source
    local User = RLCore.Functions.GetPlayer(src)
    if User.PlayerData["money"]["cash"] >= 1500 then
        User.Functions.RemoveMoney('cash', money)
        TriggerClientEvent("oxyrun:startOxyRun", src)
    else
        TriggerClientEvent("RLCore:Notify", src, "You don't have enough Money for this!", "error") 
    end
end)

RegisterServerEvent('oxy:moneyforPackage')
AddEventHandler('oxy:moneyforPackage', function()
    local src = source
    local User = RLCore.Functions.GetPlayer(src)
    local amount = math.random(Config.MinAmount, Config.MaxAmount)
    User.Functions.AddMoney("cash", amount)
end)
