ESX = exports['es_extended']:getSharedObject()

local webhook = "" -- add your webhook here

lib.callback.register('t-shops:BuyItem', function(source, item, amount, method, price)
    local xPlayer = ESX.GetPlayerFromId(source)

    if method == "kortti" then
        if xPlayer.getAccount('bank').money > price-1 then
            xPlayer.removeAccountMoney('bank', price)
            exports.ox_inventory:AddItem(source, item, amount)
            TriggerClientEvent('esx:showNotification', source, Config.Locale.buyed..amount..' '..xPlayer.getInventoryItem(item).label, 'success', 'fas fa-cart-shopping')
            LOG('## Shop  \n  Player: **'..GetPlayerName(source)..'**  \n Hex: **'..GetPlayerIdentifier(source)..'**  \n Buyed: '..amount..'x - '..item)
        else
            TriggerClientEvent('esx:showNotification', source, Config.Locale.nomoney, 'error', 'fas fa-cart-shopping')
        end
    elseif method == "raha" then
        if xPlayer.getAccount('money').money > price-1 then
            exports.ox_inventory:RemoveItem(source, 'money', price)
            exports.ox_inventory:AddItem(source, item, amount)
            TriggerClientEvent('esx:showNotification', source, Config.Locale.buyed..amount..' '..xPlayer.getInventoryItem(item).label, 'success', 'fas fa-cart-shopping')
            LOG('## Shop  \n  Player: **'..GetPlayerName(source)..'**  \n Hex: **'..GetPlayerIdentifier(source)..'**  \n Buyed: '..amount..'x - '..item)
        else
            TriggerClientEvent('esx:showNotification', source, Config.Locale.nomoney, 'error', 'fas fa-cart-shopping')
        end
    end
end)

function LOG(msg)
    local connect = {  {  ["description"] = msg, ["footer"] = { ["text"] = os.date("\n📅 %d.%m.%Y \n⏰ %X"), }, } }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = 'T-Scripts', embeds = connect}), { ['Content-Type'] = 'application/json' })
end