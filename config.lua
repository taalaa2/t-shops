Config = {}

Config.Shops = {
    {
        label = "Shop",
        blip = {
            sprite = 59,
            scale = 0.5,
            colour = 2,
        },
        useBlip = false,
        ped = "mp_m_shopkeep_01",
        scenario = "WORLD_HUMAN_AA_COFFEE",
        coords = {
            { coords = vec4(-47.4079, -1758.8149, 28.4210, 46.8706), target = vec3(-47.4079, -1758.8149, 29.4210) }, -- GROVE
            { coords = vec4(24.3972, -1346.4479, 28.4968, 267.2970), target = vec3(24.3972, -1346.4479, 29.4968) },-- UNICORN
            { coords = vec4(372.8158, 327.2358, 102.5662, 253.3366), target = vec3(372.8158, 327.2358, 103.5662) },-- YLÄKAUPUNKI
            { coords = vec4(-706.0600, -914.5424, 18.2156, 87.1589), target = vec3(-706.0600, -914.5424, 19.2156) }, --KIINAMONUMENTTI
            { coords = vec4(1164.8336, -323.6803, 68.2051, 103.9603), target = vec3(1164.8336, -323.6803, 69.2051) },--ANKKALAMPI
            { coords = vec4(-1819.4894, 793.5927, 137.0846, 132.2473), target = vec3(-1819.4894, 793.5927, 138.0846) },--JOKITIE
            { coords = vec4(549.1345, 2670.5137, 41.1563, 98.6983), target = vec3(549.1345, 2670.5137, 42.1563) }, -- ROUTE68
            { coords = vec4(1166.8757, 2710.8420, 37.1577, 181.7920), target = vec3(1166.8757, 2710.8420, 38.1577) }, -- ROUTE68 KALJAKAUPPA
            { coords = vec4(1959.6416, 3740.7327, 31.3435, 300.6786), target = vec3(1959.6416, 3740.7327, 32.3435) },-- KESKIMAA KESKUSTA
            { coords = vec4(2677.3958, 3279.8323, 54.2409, 330.9443), target = vec3(2677.3958, 3279.8323, 55.2409) },-- ITÄNEN
            { coords = vec4(1697.2708, 4923.5083, 41.0636, 325.9174), target = vec3(1697.2708, 4923.5083, 42.0636) },-- KESKIMAA FARMIPELLOT
            { coords = vec4(1728.2184, 6415.8950, 34.0370, 241.7317), target = vec3(1728.2184, 6415.8950, 35.0370) },-- POHJONEN
        },
        items = {
            { label = "Phone", item = "phone", price = 700 },
            { label = "Radio", item = "radio", price = 300 },
            { label = "Contract", item = "contract", price = 500 }
        }
    -- },
    -- {
    --     label = "Toolshop",
    --     blip = {
    --         sprite = 59,
    --         scale = 0.5,
    --         colour = 2,
    --     },
    --     useBlip = true,
    --     ped = "s_m_m_autoshop_02",
    --     scenario = "WORLD_HUMAN_AA_COFFEE",
    --     coords = {
    --         { coords = vec4(55.4179, -1739.3563, 28.5899, 48.1856), target = vec3(55.4179, -1739.3563, 29.5899) }, -- etelä
    --     },
    --     items = {
    --         { label = "Lockpick", item = "lockpick", price = 25 },
    --     }
    }
}

Config.Locale = {
    -- finnish
    -- price = "Hinta: ",
    -- amount = "Määrä ?",
    -- amount2 = "€ / kpl",
    -- paymethod = "Maksutapa",
    -- paydes = "Valitse tapa millä maksat ostokset",
    -- paycanceled = "Ostotapahtuma keskeytetty!",
    -- alertBuy = "Osta",
    -- alertCancel = "Peruuta",
    -- alert1 = "## Ostotapahtuma  \n Esine: **",
    -- alert2 = "**  \n Määrä: **",
    -- alert3 = "x**  \n YHT Hinta: **",
    -- alert4 = "€**  \n Maksutapa: **",
    -- buyed = "Ostit x",
    -- nomoney = "Ei tarpeeksi rahaa, koita toista maksutapaa!",
    -- bank = "Kortti",
    -- cash = "Käteinen"

    -- english
    price = "Price: ",
    amount = "Amount ?",
    amount2 = "€ / kpl",
    paymethod = "Paymethod",
    paydes = "Choose the way you pay for your purchases",
    paycanceled = "Canceled!",
    alertBuy = "Buy",
    alertCancel = "Cancel",
    alert1 = "## Buy  \n Item: **",
    alert2 = "**  \n Amount: **",
    alert3 = "x**  \n Price: **",
    alert4 = "€**",
    buyed = "Buyed x",
    nomoney = "No money!",
    bank = "Card",
    cash = "Cash"
}