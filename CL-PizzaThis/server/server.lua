local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("pmenu", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:OpenMenu", src)
end)

QBCore.Functions.CreateUseableItem("pbeermugfull", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pbeermugfull", false, "Beer", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'prop_mug_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["Beer"])
end)

QBCore.Functions.CreateUseableItem("predwine", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "predwine", false, "Red Wine", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'p_wine_glass_s', 28422, { x=0.01, y=-0.01, z=-0.07 }, Config.Thirst["RedWine"])
end)

QBCore.Functions.CreateUseableItem("pwhitewine", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pwhitewine", false, "White Wine", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'prop_drink_whtwine', 28422, { x=0.01, y=-0.01, z=-0.07 }, Config.Thirst["WhiteWine"])
end)

QBCore.Functions.CreateUseableItem("ppinkwine", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "ppinkwine", false, "Pink Wine", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'prop_drink_redwine', 28422, { x=0.01, y=-0.01, z=-0.07 }, Config.Thirst["PinkWine"])
end)

QBCore.Functions.CreateUseableItem("pdusche", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pdusche", false, "Dusche Beer", "mp_player_intdrink", "loop_bottle", 'prop_beerdusche', 60309, { x=0.01, y=-0.01, z=-0.13 }, Config.Thirst["Beer"])
end)

QBCore.Functions.CreateUseableItem("plogger", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "plogger", false, "Logger Beer", "mp_player_intdrink", "loop_bottle", 'prop_beer_logger', 60309, { x=0.01, y=-0.01, z=-0.12 }, Config.Thirst["Beer"])
end)

QBCore.Functions.CreateUseableItem("pam", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pam", false, "AM Beer", "mp_player_intdrink", "loop_bottle", 'prop_beer_amopen', 60309, { x=0.01, y=-0.01, z=-0.12 }, Config.Thirst["Beer"])
end)

QBCore.Functions.CreateUseableItem("pwhiskey", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pwhiskey", false, "Whiskey", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'prop_drink_whisky', 28422, { x=0.01, y=-0.01, z=-0.07 }, Config.Thirst["Whiskey"])
end)

QBCore.Functions.CreateUseableItem("pgoldsake", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pgoldsake", false, "Gold Sake", "mp_player_intdrink", "loop_bottle", 'prop_wine_white', 60309, { x=0.01, y=-0.01, z=-0.24 }, Config.Thirst["GoldSake"])
end)

QBCore.Functions.CreateUseableItem("prum", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "prum", false, "Rum", "mp_player_intdrink", "loop_bottle", 'prop_rum_bottle', 60309, { x=0.01, y=-0.01, z=-0.17 }, Config.Thirst["Rum"])
end)

QBCore.Functions.CreateUseableItem("pwhitewinebottle", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pwhitewinebottle", false, "White Wine", "mp_player_intdrink", "loop_bottle", 'prop_wine_bot_02', 60309, { x=0.01, y=-0.01, z=-0.27 }, Config.Thirst["WhiteWineBottle"])
end)

QBCore.Functions.CreateUseableItem("pwhiskeybottle", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pwhiskeybottle", false, "Whiskey Bottle", "mp_player_intdrink", "loop_bottle", 'prop_whiskey_bottle', 60309, { x=0.01, y=-0.01, z=-0.16 }, Config.Thirst["WhiskeyBottle"])
end)

QBCore.Functions.CreateUseableItem("pchampagne", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pchampagne", true, "Champagne")
end)

QBCore.Functions.CreateUseableItem("porange", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Eat", src, false, "porange", 'Orange', 4000, Config.Hunger["Orange"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'ng_proc_food_ornge1a', 60309, { x=0.03, y=-0.02, z=-0.03 })
end)

QBCore.Functions.CreateUseableItem("papple", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Eat", src, true, "papple", 'Apple', 4000, Config.Hunger["Apple"], "mp_player_inteat@burger", "mp_player_int_eat_burger")
end)

QBCore.Functions.CreateUseableItem("pbanana", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Eat", src, false, "pbanana", 'Banana', 4000, Config.Hunger["Banana"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'ng_proc_food_nana1a', 60309, { x=0.05, y=-0.04, z=-0.03 })
end)

QBCore.Functions.CreateUseableItem("pwatercup", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pwatercup", false, "Water Cup", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'prop_plastic_cup_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["WaterCup"])
end)

QBCore.Functions.CreateUseableItem("predwinebottle", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "predwinebottle", false, "Regular Red Wine", "mp_player_intdrink", "loop_bottle", 'prop_wine_red', 60309, { x=0.01, y=-0.01, z=-0.27 }, Config.Thirst["RedWineBottle"], true)
end)

QBCore.Functions.CreateUseableItem("psparklingwine", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "psparklingwine", false, "Sparkling Wine", "mp_player_intdrink", "loop_bottle", 'prop_wine_bot_02', 60309, { x=0.01, y=-0.01, z=-0.27 }, Config.Thirst["SparklingBottle"], true)
end)

QBCore.Functions.CreateUseableItem("pcastellobrolio", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pcastellobrolio", false, "Castello Brolio Red Wine", "mp_player_intdrink", "loop_bottle", 'prop_wine_bot_01', 60309, { x=0.01, y=-0.01, z=-0.27 }, Config.Thirst["CastelloBrolioBottle"], true)
end)

QBCore.Functions.CreateUseableItem("pgaryfarrel", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pgaryfarrel", false, "Gary Reffel Red Wine", "mp_player_intdrink", "loop_bottle", 'prop_wine_bot_01', 60309, { x=0.01, y=-0.01, z=-0.27 }, Config.Thirst["GaryReffelBottle"], true)
end)

QBCore.Functions.CreateUseableItem("prutherfordhill", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "prutherfordhill", false, "Rutherford Hill Red Wine", "mp_player_intdrink", "loop_bottle", 'prop_wine_bot_01', 60309, { x=0.01, y=-0.01, z=-0.27 }, Config.Thirst["RutherfordHillBottle"], true)
end)

QBCore.Functions.CreateUseableItem("ppinkwinebottle", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "ppinkwinebottle", false, "Pink Wine Bottle", "mp_player_intdrink", "loop_bottle", 'prop_wine_rose', 60309, { x=0.01, y=-0.01, z=-0.26 }, Config.Thirst["PinkWineBottle"], true)
end)

QBCore.Functions.CreateUseableItem("pespressomacchiato", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pespressomacchiato", false, "Espresso Macchiato", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'prop_mug_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["EspressoMacchiato"])
end)

QBCore.Functions.CreateUseableItem("pcaramelfrappucino", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pcaramelfrappucino", false, "Caramel Frappucino", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'prop_mug_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["CaramelFrappucino"])
end)

QBCore.Functions.CreateUseableItem("pcoldbrewlatte", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pcoldbrewlatte", false, "Coldbrew Latte", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'prop_mug_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["ColdbrewLatte"])
end)

QBCore.Functions.CreateUseableItem("pstrawberryvanillaoatlatte", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pstrawberryvanillaoatlatte", false, "Strawberry Vanilla Oat Latte", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'prop_mug_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["StrawberryVanillaOatLatte"])
end)

QBCore.Functions.CreateUseableItem("pcocacola", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "pcocacola", false, "CocaCola", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'prop_cs_bs_cup', 28422, { x=0.01, y=-0.01, z=-0.05 }, Config.Thirst["CocaCola"])
end)

QBCore.Functions.CreateUseableItem("psprite", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "psprite", false, "Sprite", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'ng_proc_sodacan_01b', 28422, { x=0.01, y=-0.01, z=-0.10 }, Config.Thirst["Sprite"])
end)

QBCore.Functions.CreateUseableItem("ppepper", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Drink", src, "ppepper", false, "DR.Pepper", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'prop_plastic_cup_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["DRPepper"])
end)

QBCore.Functions.CreateUseableItem("pmargharita", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("pmargharitaslice", 6)
    Player.Functions.RemoveItem("pmargharita", 1)
end)

QBCore.Functions.CreateUseableItem("pnapollitano", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("pnapollitanoslice", 6)
    Player.Functions.RemoveItem("pnapollitano", 1)
end)

QBCore.Functions.CreateUseableItem("pmushroomspizza", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("pmushroomspizzaslice", 6)
    Player.Functions.RemoveItem("pmushroomspizza", 1)
end)

QBCore.Functions.CreateUseableItem("pseafood", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("pseafoodslice", 6)
    Player.Functions.RemoveItem("pseafood", 1)
end)

QBCore.Functions.CreateUseableItem("pvegpizza", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("pvegpizzaslice", 6)
    Player.Functions.RemoveItem("pvegpizza", 1)
end)

QBCore.Functions.CreateUseableItem("pmacncheese", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Eat", src, false, "pmacncheese", 'Mac N Cheese', 5000, Config.Hunger["MacNCheese"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'prop_cs_bowl_01b', 60309, { x=0.01, y=-0.01, z=-0.0 })
end)

QBCore.Functions.CreateUseableItem("pbbqporkmac", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Eat", src, false, "pbbqporkmac", 'BBQ Pork Mac', 5000, Config.Hunger["BBQPorkMac"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'prop_cs_bowl_01b', 60309, { x=0.01, y=-0.01, z=-0.0 })
end)

QBCore.Functions.CreateUseableItem("pfresca", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Eat", src, false, "pfresca", 'Pasta Fresca', 5000, Config.Hunger["PastaFresca"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'prop_cs_bowl_01b', 60309, { x=0.01, y=-0.01, z=-0.0 })
end)

QBCore.Functions.CreateUseableItem("pmargharitaslice", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Eat", src, false, "pmargharitaslice", 'Pizza Margharita', 5000, Config.Hunger["PizzaMargharita"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'v_res_tt_pizzaplate', 60309, { x=0.01, y=-0.01, z=-0.0 })
end)

QBCore.Functions.CreateUseableItem("pnapollitanoslice", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Eat", src, false, "pnapollitanoslice", 'Pizza Napollitano', 5000, Config.Hunger["PizzaNapollitano"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'v_res_tt_pizzaplate', 60309, { x=0.01, y=-0.01, z=-0.0 })
end)

QBCore.Functions.CreateUseableItem("pmushroomspizzaslice", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Eat", src, false, "pmushroomspizzaslice", 'Pizza Fungi', 5000, Config.Hunger["PizzaFungi"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'v_res_tt_pizzaplate', 60309, { x=0.01, y=-0.01, z=-0.0 })
end)

QBCore.Functions.CreateUseableItem("pseafoodslice", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Eat", src, false, "pseafoodslice", 'Pizza Seafood', 5000, Config.Hunger["PizzaSeafood"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'v_res_tt_pizzaplate', 60309, { x=0.01, y=-0.01, z=-0.0 })
end)

QBCore.Functions.CreateUseableItem("pvegpizzaslice", function(source, item)
    local src = source
    TriggerClientEvent("CL-Pizzeria:Eat", src, false, "pvegpizzaslice", 'Vegetarian Pizza', 5000, Config.Hunger["VegetarianPizza"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'v_res_tt_pizzaplate', 60309, { x=0.01, y=-0.01, z=-0.0 })
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckDuty', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.onduty then
        cb(true)
    else
        cb(false)
	end
end)

RegisterServerEvent('CL-Pizzeria:ResetDuty', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.SetJobDuty(false)  
end)

RegisterServerEvent('CL-Pizzeria:TakeMoney', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= data.price then
        TriggerClientEvent("CL-Pizzeria:SpawnVehicle", src, data.vehicle)  
        Player.Functions.RemoveMoney("cash", data.price)
        TriggerClientEvent('QBCore:Notify', src, Config.Locals["Notifications"]["VehicleBought"], "success")    
    else
        TriggerClientEvent('QBCore:Notify', src, Config.Locals["Notifications"]["DontHaveEnoughMoney"], "error")              
    end    
end)

RegisterServerEvent('CL-Pizzeria:BuyGlass', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= data.price then
        Player.Functions.RemoveMoney("cash", data.price)
        Player.Functions.AddItem(data.glass, 1)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[data.glass], "add")
        TriggerClientEvent('QBCore:Notify', src, data.glassname .. ' Successfully Bought', "success")   
    else
        TriggerClientEvent('QBCore:Notify', src, Config.Locals["Notifications"]["DontHaveEnoughMoney"], "error")              
    end  
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForPizzaDoughItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local flour = Player.Functions.GetItemByName("ppizzaflour")
    local salt = Player.Functions.GetItemByName("psalt")
    local oil = Player.Functions.GetItemByName("poil")
    local water = Player.Functions.GetItemByName("pwater")
    if flour ~= nil and salt ~= nil and oil ~= nil and water ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForStrawberryVanillaOatLatteItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local glass = Player.Functions.GetItemByName("pcoffeeglass")
    local milk = Player.Functions.GetItemByName("pmilk")
    local beans = Player.Functions.GetItemByName("pcoffeebeans")
    if glass ~= nil and milk ~= nil and beans ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForColdBrewLatteItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local glass = Player.Functions.GetItemByName("phighcoffeeglasscup")
    local milk = Player.Functions.GetItemByName("pmilk")
    local beans = Player.Functions.GetItemByName("pcoffeebeans")
    if glass ~= nil and milk ~= nil and beans ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForCaramelFrappucinoItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local glass = Player.Functions.GetItemByName("phighcoffeeglasscup")
    local milk = Player.Functions.GetItemByName("pmilk")
    local beans = Player.Functions.GetItemByName("pcoffeebeans")
    local cream = Player.Functions.GetItemByName("pcream")
    local caramel = Player.Functions.GetItemByName("pcaramelsyrup")
    if glass ~= nil and milk ~= nil and beans ~= nil and cream ~= nil and caramel ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForEspressoMacchiatoItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local glass = Player.Functions.GetItemByName("pespressocoffeecup")
    local milk = Player.Functions.GetItemByName("pmilk")
    local beans = Player.Functions.GetItemByName("pcoffeebeans")
    if glass ~= nil and milk ~= nil and beans ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForPizzaBaseItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local flour = Player.Functions.GetItemByName("ppizzaflour")
    local dough = Player.Functions.GetItemByName("pdough")
    local souce = Player.Functions.GetItemByName("ptomatosouce")
    if flour ~= nil and dough ~= nil and souce ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForMargharitaPizzaItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local basil = Player.Functions.GetItemByName("pbasil")
    local mozzarella = Player.Functions.GetItemByName("pmozzarella")
    local oil = Player.Functions.GetItemByName("poil")
    local salt = Player.Functions.GetItemByName("psalt")
    local pizzabase = Player.Functions.GetItemByName("ppizzabase")
    if basil ~= nil and mozzarella ~= nil and oil ~= nil and salt ~= nil and pizzabase ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForNapollitanoPizzaItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local basil = Player.Functions.GetItemByName("pbasil")
    local mozzarella = Player.Functions.GetItemByName("pmozzarella")
    local salt = Player.Functions.GetItemByName("psalt")
    local pizzabase = Player.Functions.GetItemByName("ppizzabase")
    if basil ~= nil and mozzarella ~= nil and salt ~= nil and pizzabase ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForMushroomsPizzaItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local butter = Player.Functions.GetItemByName("pbutter")
    local mozzarella = Player.Functions.GetItemByName("pmozzarella")
    local oil = Player.Functions.GetItemByName("poil")
    local pizzabase = Player.Functions.GetItemByName("ppizzabase")
    if butter ~= nil and mozzarella ~= nil and oil ~= nil and pizzabase ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForSeafoodPizzaItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local seafoodmix = Player.Functions.GetItemByName("pseafoodmix")
    local mozzarella = Player.Functions.GetItemByName("pmozzarella")
    local basil = Player.Functions.GetItemByName("pbasil")
    local pizzabase = Player.Functions.GetItemByName("ppizzabase")
    local salt = Player.Functions.GetItemByName("psalt")
    if seafoodmix ~= nil and mozzarella ~= nil and basil ~= nil and pizzabase ~= nil and salt ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForVegetarianPizzaItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tomatoes = Player.Functions.GetItemByName("ptomatoes")
    local cheese = Player.Functions.GetItemByName("pvegicheese")
    local basil = Player.Functions.GetItemByName("pbasil")
    local pizzabase = Player.Functions.GetItemByName("ppizzabase")
    local salt = Player.Functions.GetItemByName("psalt")
    if tomatoes ~= nil and cheese ~= nil and basil ~= nil and pizzabase ~= nil and salt ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForMacNCheeseItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local macaroni = Player.Functions.GetItemByName("pelbowmacaroni")
    local butter = Player.Functions.GetItemByName("pbutter")
    local milk = Player.Functions.GetItemByName("pmilk")
    local ccheese = Player.Functions.GetItemByName("pcheddarcheese")
    local pcheese = Player.Functions.GetItemByName("pparmesancheese")
    if macaroni ~= nil and butter ~= nil and milk ~= nil and ccheese ~= nil and pcheese ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForBBQPorkMacItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local meat = Player.Functions.GetItemByName("pporkmeat")
    local pasta = Player.Functions.GetItemByName("pelbowmacaroni")
    local milk = Player.Functions.GetItemByName("pmilk")
    local ccheese = Player.Functions.GetItemByName("pcheddarcheese")
    local bbqsouce = Player.Functions.GetItemByName("pbbqsouce")
    if meat ~= nil and pasta ~= nil and milk ~= nil and ccheese ~= nil and bbqsouce ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('CL-Pizzeria:CheckForPastaFrescaItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pasta = Player.Functions.GetItemByName("pregularpasta")
    local oil = Player.Functions.GetItemByName("poliveoil")
    local tomatoes = Player.Functions.GetItemByName("ptomatoes")
    local seafoodmix = Player.Functions.GetItemByName("pseafoodmix")
    if pasta ~= nil and oil ~= nil and tomatoes ~= nil and seafoodmix ~= nil then
        cb(true)
    else
        cb(false)
	end
end)