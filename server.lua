local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("ggwpx:giveCash", function(targetPlayer, amount)
    local src = source
    local sender = QBCore.Functions.GetPlayer(src)
    local receiver = QBCore.Functions.GetPlayer(targetPlayer)

    print("Received Target Player ID:", targetPlayer)
    
    if not receiver then
        print("Receiver not found!")
        TriggerClientEvent("QBCore:Notify", src, Config.Notifications.TargetNotFound, "error")
        return
    end

    if amount < Config.MinAmount or amount > Config.MaxAmount then
        TriggerClientEvent("QBCore:Notify", src, Config.Notifications.InvalidAmount, "error")
        return
    end

    if sender.Functions.RemoveMoney("cash", amount) then
        receiver.Functions.AddMoney("cash", amount)

        TriggerClientEvent("QBCore:Notify", src, string.format(Config.Notifications.GaveMoney, amount, receiver.PlayerData.charinfo.firstname), "success")
        TriggerClientEvent("QBCore:Notify", targetPlayer, string.format(Config.Notifications.ReceivedMoney, amount, sender.PlayerData.charinfo.firstname), "success")
    else
        TriggerClientEvent("QBCore:Notify", src, Config.Notifications.NotEnoughMoney, "error")
    end
end)
