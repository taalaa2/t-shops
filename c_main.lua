ESX = exports['es_extended']:getSharedObject()

CreateThread(function()
    for k,v in ipairs(Config.Shops) do
        local label = v.label
        local model = v.ped
        local items = {}
    
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end
                
        for k,v in ipairs(v.items) do
            items[#items+1] = {
                title = v.label,
                description = Config.Locale.price..v.price..Config.Locale.amount2,
                icon = "nui://ox_inventory/web/images/"..v.item..".png",
                onSelect = function()
                    local input = lib.inputDialog(label, {
                        { label = Config.Locale.amount, required = true, type = "number", min = 1, description = v.label.. ' - '..v.price..Config.Locale.amount2, icon = "fas fa-arrow-pointer" },
                        { label = Config.Locale.paymethod, required = true, type = "select", description = Config.Locale.paydes, icon = "fas fa-credit-card", options = {
                            { label = Config.Locale.bank, value = "kortti" },
                            { label = Config.Locale.cash, value = "raha" }
                        }}
                    })

                    if input then
                        local alert = lib.alertDialog({
                            header = label,
                            content = Config.Locale.alert1..v.label..Config.Locale.alert2..input[1]..Config.Locale.alert3..input[1]*v.price..Config.Locale.alert4,
                            centered = true,
                            cancel = true,
                            labels = {
                                confirm = Config.Locale.alertBuy,
                                cancel = Config.Locale.alertCancel
                            }
                        })

                        if alert == "confirm" then
                            lib.callback.await('t-shops:BuyItem', source, v.item, input[1], input[2], input[1]*v.price)
                        elseif alert == "cancel" then
                            ESX.ShowNotification(Config.Locale.paycanceled, 'error', 'fas fa-cart-shopping')
                        end
                    end
                end
            }
        end
    
        for k, v in ipairs(v.coords) do
            blipCoords = v.target
            entity = CreatePed(0, model, v.coords, false, false)

            exports.ox_target:addBoxZone({
                coords = v.target,
                size = vec3(1,1,1),
                rotation = 0.5,
                options = {
                    {
                        label = label,
                        icon = "fas fa-cart-shopping",
                        distance = 2.5,
                        onSelect = function()
                            lib.registerContext({
                                title = label,
                                id = "menu",
                                options = items
                            })
                            lib.showContext("menu")
                        end
                    }
                }
            })
        end
        SetEntityAsMissionEntity(entity, true, false)
        SetPedRelationshipGroupHash(entity, GetHashKey("PLAYER"))
        FreezeEntityPosition(entity, true)
        SetEntityInvincible(entity, true)
        DisablePedPainAudio(entity, true)
        StopPedSpeaking(entity, true)
        SetPedCombatMovement(entity, true)
        SetPedAsEnemy(entity, false)
        TaskSetBlockingOfNonTemporaryEvents(entity, true)
        SetPedDiesWhenInjured(entity, false)
        SetPedCanPlayAmbientAnims(entity, true)
        SetPedCanRagdollFromPlayerImpact(entity, false)
        TaskStartScenarioInPlace(entity, v.scenario, 0, false) 

        if v.useBlip then
            local blip = AddBlipForCoord(blipCoords)

            SetBlipSprite (blip, v.blip.sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, v.blip.scale)
            SetBlipColour (blip, v.blip.colour)
            SetBlipAsShortRange(blip, true)
        
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(label)
            EndTextCommandSetBlipName(blip) 
        end
    end
end)