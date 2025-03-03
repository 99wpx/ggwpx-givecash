local QBCore = exports['qb-core']:GetCoreObject()

function openGiveMoneyMenu(targetPlayer)
    exports['qb-menu']:openMenu({
        {
            header = "Give Cash",
            isMenuHeader = true
        },
        {
            header = "Enter Amount",
            txt = "Input the amount of cash to give",
            params = {
                event = "ggwpx:openCashInput",
                args = targetPlayer
            }
        },
        {
            header = "Cancel",
            params = {
                event = "qb-menu:closeMenu"
            }
        }
    })
end

RegisterNetEvent("ggwpx:openCashInput", function(targetPlayer)
    local dialog = exports['qb-input']:ShowInput({
        header = "Enter Amount",
        submitText = "Give",
        inputs = {
            {
                text = "Amount", 
                name = "amount", 
                type = "number", 
                isRequired = true
            }
        }
    })

    if dialog and dialog.amount then
        local amount = tonumber(dialog.amount)
        if amount and amount > 0 then
            TriggerServerEvent("ggwpx:giveCash", targetPlayer, amount)
        else
            QBCore.Functions.Notify("Invalid amount!", "error")
        end
    end
end)

if Config.Target == 'qb' then
    exports['qb-target']:AddGlobalPlayer({
        options = {
            {
                action = function(target)
                    --print("DEBUG: Target received from qb-target:", target)

                    local playerIndex = NetworkGetPlayerIndexFromPed(target)
                    local targetServerId = GetPlayerServerId(playerIndex)

                   -- print("DEBUG: Converted Target Server ID:", targetServerId)

                    if targetServerId and targetServerId > 0 then
                        openGiveMoneyMenu(targetServerId)
                    else
                        QBCore.Functions.Notify("Player not found!", "error")
                    end
                end,
                icon = "fas fa-money",
                label = "Give Cash"
            }
        },
        distance = Config.TargetDistance
    })
end
