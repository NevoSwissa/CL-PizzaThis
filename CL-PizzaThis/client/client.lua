local QBCore = exports['qb-core']:GetCoreObject()

local PlayerJob = {}

local drinked = 0

local dough = 0

local ClipBoardSpawned = false

----------------
----Handlers
----------------
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
	end)
	if not ClipBoardSpawned then
		SpawnClipBoard()
	end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
		PlayerJob = QBCore.Functions.GetPlayerData().job
		QBCore.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
			if PlayerData.job.onduty then
				if PlayerData.job.name == Config.Job then
					TriggerServerEvent("QBCore:ToggleDuty")
				end
			end
		end)
    end
end)

----------------
----Blips
----------------
Citizen.CreateThread(function()
	for k, v in pairs(Config.Locations['General']['Blips']) do
		if Config.UseBlips then
			Blip = AddBlipForCoord(v.Coords.x, v.Coords.y, v.Coords.z)
			SetBlipSprite(Blip, v.BlipId)
			SetBlipDisplay(Blip, 4)
			SetBlipScale(Blip, 0.6)	
			SetBlipColour(Blip, v.BlipColour)
			SetBlipAsShortRange(Blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.Title)
			EndTextCommandSetBlipName(Blip)
		end
	end	
end)

----------------
----Garage Marker
----------------
CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        local plyCoords = GetEntityCoords(plyPed)
        local letSleep = true        

        if PlayerJob.name == Config.Job then
            if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, Config.Locations["Garage"]["Marker"].x, Config.Locations["Garage"]["Marker"].y, Config.Locations["Garage"]["Marker"].z, true) < Config.MarkerDistance) then
                letSleep = false
                DrawMarker(36, Config.Locations["Garage"]["Marker"].x, Config.Locations["Garage"]["Marker"].y, Config.Locations["Garage"]["Marker"].z + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.5, 0.5, 162, 33, 36, 255, true, false, false, true, false, false, false)
                 if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, Config.Locations["Garage"]["Marker"].x, Config.Locations["Garage"]["Marker"].y, Config.Locations["Garage"]["Marker"].z, true) < 1.5) then
                    DrawText3D(Config.Locations["Garage"]["Marker"].x, Config.Locations["Garage"]["Marker"].y, Config.Locations["Garage"]["Marker"].z, "~g~E~w~ - Pizzeria Garage") 
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("CL-Pizzeria:Garage:Menu")
                    end
                end  
            end
        end

        if letSleep then
            Wait(2000)
        end

        Wait(1)
    end
end)

----------------
----Events
----------------
RegisterNetEvent('CL-Pizzeria:StoreVehicle', function()
    local ped = PlayerPedId()
    local car = GetVehiclePedIsIn(PlayerPedId(), true)
    if IsPedInAnyVehicle(ped, false) then
        TaskLeaveVehicle(ped, car, 1)
        Citizen.Wait(2000)
        QBCore.Functions.Notify(Config.Locals["Notifications"]["VehicleStored"], 'success')
        DeleteVehicle(car)
        DeleteEntity(car)
    else
        QBCore.Functions.Notify(Config.Locals["Notifications"]["NotInAnyVehicle"], "error")
    end
end)

RegisterNetEvent("CL-Pizzeria:SpawnVehicle", function(vehicle)
    local coords = vector4(809.81219, -732.6318, 27.597684, 133.52844)
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "PIZZA"..tostring(math.random(1000, 9999)))
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end)

RegisterNetEvent('CL-Pizzeria:OpenShop', function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
		if result then
			TriggerServerEvent("inventory:server:OpenInventory", "shop", "Main Shop", Config.ShopItems)
		else
			QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
		end
	end)
end)

RegisterNetEvent('CL-Pizzeria:OpenAddonsShop', function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
		if result then
			TriggerServerEvent("inventory:server:OpenInventory", "shop", "Pizza Extras", Config.PizzaExtrasItems)
		else
			QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
		end
	end)
end)

RegisterNetEvent('CL-Pizzeria:WashHands', function(data)
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
		if result then
			SetEntityHeading(PlayerPedId(), data.heading)
			QBCore.Functions.Progressbar("wash_hands", Config.Locals["Progressbars"]["WashHands"]["Text"], Config.Locals["Progressbars"]["WashHands"]["Time"], false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {
                animDict = 'mp_arresting',
                anim = 'a_uncuff',
				flags = 49,
			}, {}, {}, function()
				TriggerServerEvent('hud:server:RelieveStress', Config.WashingHandsStress)
			end, function()
				QBCore.Functions.Notify("Canceled...", "error")
			end)
		else
			QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
		end
	end)
end)

RegisterNetEvent('CL-Pizzeria:OpenBossStash', function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
		if result then
			TriggerServerEvent("inventory:server:OpenInventory", "stash", "Pizza This Boss Storage") 
			TriggerEvent("inventory:client:SetCurrentStash", "Pizza This Boss Storage")
		else
			QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
		end
	end)
end)

RegisterNetEvent('CL-Pizzeria:OpenFoodFridge', function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
		if result then
			TriggerServerEvent("inventory:server:OpenInventory", "shop", "Food Fridge", Config.FoodFridgeItems)
		else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
        end
	end)
end)

RegisterNetEvent("CL-Pizzeria:OpenPersonalStash", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
		if result then
			TriggerServerEvent("inventory:server:OpenInventory", "stash", "pizzathisstash_"..QBCore.Functions.GetPlayerData().citizenid)
			TriggerEvent("inventory:client:SetCurrentStash", "pizzathisstash_"..QBCore.Functions.GetPlayerData().citizenid)
		else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
        end
	end)
end)

RegisterNetEvent("CL-Pizzeria:MakeDrink", function(data)
    QBCore.Functions.TriggerCallback('CL-Pizzeria:HasItem', function(result)
        if result then
            QBCore.Functions.Progressbar("make_"..data.drink, "Pouring " ..data.drinkname, 5000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = 'anim@amb@clubhouse@bar@drink@one',
				anim = 'one_bartender',
				flags = 49,
			}, {}, {}, function()
                QBCore.Functions.Notify(data.drinkname .. " Successfully Made", "success")
                TriggerServerEvent("CL-Pizzeria:RemoveItem", data.glass, 1)
                TriggerServerEvent("CL-Pizzeria:AddItem", data.drink, 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.drink], "add")
			end, function()
				QBCore.Functions.Notify("Canceled...", "error")
			end)
        else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["NoIngredients"], "error")
        end
    end, data.glass)
end)

RegisterNetEvent("CL-Pizzeria:Drink", function(item, ischampagne, itemname, anim, animdict, model, bones, coords, thirst)
	if ischampagne then
		QBCore.Functions.Progressbar("drinking_"..item, "Drinking " ..itemname, 3700, false, true, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		}, {
			animDict = "anim@amb@casino@mini@drinking@champagne_drinking@heels@base",
			anim = "outro",
			flags = 49,
		}, {}, {}, function()
			QBCore.Functions.Notify("You Have Drank " ..itemname, "success")
			if Config.ConsumablesVersion == "old" then
				TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + Config.Thirst["Champagne"])
			elseif Config.ConsumablesVersion == "new" then
				TriggerServerEvent("CL-Pizzeria:AddThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + Config.Thirst["Champagne"])
			end	
			TriggerServerEvent("CL-Pizzeria:RemoveItem", item, 1)
			AlcoholEffect()
		end, function()
			QBCore.Functions.Notify("Canceled...", "error")
		end)
	else
		QBCore.Functions.Progressbar("drinking_"..item, "Drinking " ..itemname, Config.Locals["Progressbars"]["Drink"]["Time"], false, true, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		}, {
			animDict = anim,
			anim = animdict,
			flags = 49,
		}, {
			model = model,
			bone = bones,
			coords = { x=coords.x, y=coords.y, z=coords.z },
		}, {}, function()
			QBCore.Functions.Notify("You Have Drank " ..itemname, "success")
			if Config.ConsumablesVersion == "old" then
				TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + thirst)
			elseif Config.ConsumablesVersion == "new" then
				TriggerServerEvent("CL-Pizzeria:AddThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + thirst)
			end
			TriggerServerEvent("CL-Pizzeria:RemoveItem", item, 1)
			drinked = drinked + 1
			if drinked >= 3 then
				QBCore.Functions.Notify(Config.Locals["Notifications"]["DrinkedEnough"])
				drinked = 0
				AlcoholEffect()
			end
		end, function()
			QBCore.Functions.Notify("Canceled...", "error")
		end)
	end
end)

RegisterNetEvent("CL-Pizzeria:Grab", function(data)
    QBCore.Functions.Progressbar("grab_"..data.gdrink, "Grabing " ..data.gdrinkname, data.time, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
		animDict = data.animationdict,
		anim = data.animation,
        flags = 49,
    }, {}, {}, function()
        QBCore.Functions.Notify("You grabbed " ..data.gdrinkname, "success")
        TriggerServerEvent("CL-Pizzeria:AddItem", data.gdrink, 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.gdrink], "add")
		if data.dough then
			dough = dough - 1
		end
    end, function()
        QBCore.Functions.Notify("Canceled...", "error")
    end)
end)

RegisterNetEvent("CL-Pizzeria:Make", function(data)
	if not data.qbcoreevent then
		QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckFor'..data.eventname..'Items', function(HasItems)
			if HasItems then
				QBCore.Functions.Progressbar("make", "Making "..data.itemname, data.time, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = data.animdict,
					anim = data.anim,
					flags = 49,
				}, {}, {}, function()
					if data.item4 then
						TriggerServerEvent("CL-Pizzeria:RemoveItem", data.item4, 1)
						TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.item4], "remove")
					end
					if data.item5 then
						TriggerServerEvent("CL-Pizzeria:RemoveItem", data.item5, 1)
						TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.item5], "remove")
					end
					if data.item6 then
						TriggerServerEvent("CL-Pizzeria:RemoveItem", data.item6, 1)
						TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.item6], "remove")
					end
					TriggerServerEvent("CL-Pizzeria:RemoveItem", data.item2, 1)
					TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.item2], "remove")
					TriggerServerEvent("CL-Pizzeria:RemoveItem", data.item3, 1)
					TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.item3], "remove")
					TriggerServerEvent("CL-Pizzeria:AddItem", data.recieveitem, data.number)
					TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.recieveitem], "add")
				end, function()
					QBCore.Functions.Notify("Canceled...", "error")
				end)
			else
				QBCore.Functions.Notify('You Are Trying To Make '.. data.itemname ..' With Nothing ?', 'error')
			end
		end)
	else
		QBCore.Functions.TriggerCallback('CL-Pizzeria:HasItem', function(HasItems)
			if HasItems then
				QBCore.Functions.Progressbar("make", "Making "..data.itemname, data.time, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = data.animdict,
					anim = data.anim,
					flags = 49,
				}, {}, {}, function()
					if data.item4 then
						TriggerServerEvent("CL-Pizzeria:RemoveItem", data.item4, 1)
						TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.item4], "remove")
					elseif data.item5 then
						TriggerServerEvent("CL-Pizzeria:RemoveItem", data.item5, 1)
						TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.item5], "remove")
					elseif data.item6 then
						TriggerServerEvent("CL-Pizzeria:RemoveItem", data.item6, 1)
						TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.item6], "remove")
					end
					TriggerServerEvent("CL-Pizzeria:RemoveItem", data.item2, 1)
					TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.item2], "remove")
					TriggerServerEvent("CL-Pizzeria:AddItem", data.recieveitem, data.number)
					TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[data.recieveitem], "add")
				end, function()
					QBCore.Functions.Notify("Canceled...", "error")
				end)
			else
				QBCore.Functions.Notify('You Are Trying To Make '.. data.itemname ..' With Nothing ?', 'error')
			end
		end, data.qbcoreitem)
	end
end)

RegisterNetEvent('CL-Pizzeria:OpenMenu', function()
  	SendNUIMessage({action = 'OpenMenu'})
	Citizen.CreateThread(function()
        while true do
			ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Exit")
			if IsControlJustReleased(0, 177) then
				SendNUIMessage({action = 'CloseMenu'})
				PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
				break
			end
			Citizen.Wait(1)
		end
	end)
end)

RegisterNetEvent("CL-Pizzeria:AddDough", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:HasItem', function(result)
		if result then
			if dough >= 12 then
				QBCore.Functions.Notify(Config.Locals["Notifications"]["StorageFull"], "error")
			else
				dough = dough + 1
				TriggerServerEvent("CL-Pizzeria:RemoveItem", "pdough", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pdough"], "remove")
				QBCore.Functions.Notify(Config.Locals["Notifications"]["DoughAdded"], "success")
			end
		else
			QBCore.Functions.Notify(Config.Locals["Notifications"]["DontHaveDough"], "error")
		end
	end, 'pdough')
end)

RegisterNetEvent("CL-Pizzeria:Eat", function(fruit, item, itemname, time, hunger, anim, animdict, model, bones, coords)
	if not fruit then
		QBCore.Functions.Progressbar("eat_"..item, "Eating " ..itemname, time, false, true, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		}, {
			animDict = anim,
			anim = animdict,
			flags = 49,
		}, {
			model = model,
			bone = bones,
			coords = { x=coords.x, y=coords.y, z=coords.z },
		}, {}, function()
			QBCore.Functions.Notify("You eated " ..itemname, "success")
			TriggerServerEvent("CL-Pizzeria:RemoveItem", item, 1)
			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[item], "remove")
			if Config.ConsumablesVersion == "old" then
				TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + hunger)
			elseif Config.ConsumablesVersion == "new" then
				TriggerServerEvent("CL-Pizzeria:AddHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + hunger)
			end
		end, function()
			QBCore.Functions.Notify("Canceled...", "error")
		end)
	else
		QBCore.Functions.Progressbar("eat_"..item, "Eating " ..itemname, time, false, true, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		}, {
			animDict = anim,
			anim = animdict,
			flags = 49,
		}, {}, {}, function()
			QBCore.Functions.Notify("You eated " ..itemname, "success")
			TriggerServerEvent("CL-Pizzeria:RemoveItem", item, 1)
			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[item], "remove")
			if Config.ConsumablesVersion == "old" then
				TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + hunger)
			elseif Config.ConsumablesVersion == "new" then
				TriggerServerEvent("CL-Pizzeria:AddHunger", hunger)
			end
		end, function()
			QBCore.Functions.Notify("Canceled...", "error")
		end)
	end
end)

Citizen.CreateThread(function()
	exports[Config.Target]:AddBoxZone("Duty", vector3(Config.Locations["Duty"]["Coords"].x, Config.Locations["Duty"]["Coords"].y, Config.Locations["Duty"]["Coords"].z), 0.3, 0.6, {
		name = "Duty",
		heading = Config.Locations["Duty"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["Duty"]["minZ"],
		maxZ = Config.Locations["Duty"]["maxZ"],
		}, {
			options = { 
			{
				type = "client",
                event = "CL-Pizzeria:DutyMenu",
				icon = Config.Locals['Targets']['Duty']['Icon'],
				label = Config.Locals['Targets']['Duty']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	for k, v in pairs(Config.Locations["WashHands"]) do
        exports[Config.Target]:AddBoxZone("WashHands"..k, vector3(v.coords.x, v.coords.y, v.coords.z), v.poly1, v.poly2, {
            name = "WashHands"..k,
            heading = v.heading,
            debugPoly = Config.PolyZone,
            minZ = v.minZ,
            maxZ = v.maxZ,
            }, {
                options = { 
                {
                    type = "client",
					event = "CL-Pizzeria:WashHands",
					icon = Config.Locals['Targets']['WashHands']['Icon'],
					label = Config.Locals['Targets']['WashHands']['Label'],
					heading = v.heading,
					job = Config.Job,
                }
            },
            distance = 1.2,
        })
    end
    
    exports[Config.Target]:AddBoxZone("Shop", vector3(Config.Locations["Shop"]["Coords"].x, Config.Locations["Shop"]["Coords"].y, Config.Locations["Shop"]["Coords"].z), 0.5, 1.0, {
		name = "Shop",
		heading = Config.Locations["Shop"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["Shop"]["minZ"],
		maxZ = Config.Locations["Shop"]["maxZ"],
		}, {
			options = { 
			{
				type = "client",
				event = "CL-Pizzeria:OpenShop",
				icon = Config.Locals['Targets']['Shop']['Icon'],
				label = Config.Locals['Targets']['Shop']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

    exports[Config.Target]:AddBoxZone("Stash", vector3(Config.Locations["Stash"]["Coords"].x, Config.Locations["Stash"]["Coords"].y, Config.Locations["Stash"]["Coords"].z), 0.5, 1.5, {
		name = "Stash",
		heading = Config.Locations["Stash"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["Stash"]["minZ"],
		maxZ = Config.Locations["Stash"]["maxZ"],
		}, {
			options = { 
			{
				icon = Config.Locals['Targets']['Stash']['Icon'],
				label = Config.Locals['Targets']['Stash']['Label'],
				job = Config.Job,
				action = function()
					QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
						if result then
							TriggerServerEvent("inventory:server:OpenInventory", "stash", "Pizza This Stash", {maxweight = 100000, slots = 100})
							TriggerEvent("inventory:client:SetCurrentStash", "Pizza This Stash") 
						else
							QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
						end
					end)
				end,
			},
		},
		distance = 1.2,
	})
    
    exports[Config.Target]:AddBoxZone("Glasses", vector3(Config.Locations["Glasses"]["Coords"].x, Config.Locations["Glasses"]["Coords"].y, Config.Locations["Glasses"]["Coords"].z), 0.5, 1.0, {
		name = "Glasses",
		heading = Config.Locations["Glasses"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["Glasses"]["minZ"],
		maxZ = Config.Locations["Glasses"]["maxZ"],
		}, {
			options = { 
			{
				type = "client",
				event = "CL-Pizzeria:GlassesMenu",
				icon = Config.Locals['Targets']['Glasses']['Icon'],
				label = Config.Locals['Targets']['Glasses']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

    exports[Config.Target]:AddBoxZone("DrinksMachine", vector3(Config.Locations["DrinksMachine"]["Coords"].x, Config.Locations["DrinksMachine"]["Coords"].y, Config.Locations["DrinksMachine"]["Coords"].z), 0.5, 1.0, {
		name = "DrinksMachine",
		heading = Config.Locations["DrinksMachine"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["DrinksMachine"]["minZ"],
		maxZ = Config.Locations["DrinksMachine"]["maxZ"],
		}, {
			options = { 
			{
				type = "client",
				event = "CL-Pizzeria:DrinksMachineMenu",
				icon = Config.Locals['Targets']['DrinksMachine']['Icon'],
				label = Config.Locals['Targets']['DrinksMachine']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

    exports[Config.Target]:AddBoxZone("GrabDrinks", vector3(Config.Locations["GrabDrinks"]["Coords"].x, Config.Locations["GrabDrinks"]["Coords"].y, Config.Locations["GrabDrinks"]["Coords"].z), 0.5, 2.0, {
		name = "GrabDrinks",
		heading = Config.Locations["GrabDrinks"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["GrabDrinks"]["minZ"],
		maxZ = Config.Locations["GrabDrinks"]["maxZ"],
		}, {
			options = { 
			{
				type = "client",
				event = "CL-Pizzeria:GrabDrinksMenu",
				icon = Config.Locals['Targets']['GrabDrinks']['Icon'],
				label = Config.Locals['Targets']['GrabDrinks']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("BossStash", vector3(Config.Locations["BossStash"]["Coords"].x, Config.Locations["BossStash"]["Coords"].y, Config.Locations["BossStash"]["Coords"].z), 0.5, 0.7, {
		name = "BossStash",
		heading = Config.Locations["BossStash"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["BossStash"]["minZ"],
		maxZ = Config.Locations["BossStash"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:OpenBossStash",
				icon = Config.Locals['Targets']['BossStash']['Icon'],
				label = Config.Locals['Targets']['BossStash']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("GrabBossDrinks", vector3(Config.Locations["GrabBossDrinks"]["Coords"].x, Config.Locations["GrabBossDrinks"]["Coords"].y, Config.Locations["BossStash"]["Coords"].z), 0.9, 0.7, {
		name = "GrabBossDrinks",
		heading = Config.Locations["GrabBossDrinks"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["GrabBossDrinks"]["minZ"],
		maxZ = Config.Locations["GrabBossDrinks"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:GrabBossDrinksMenu",
				icon = Config.Locals['Targets']['GrabBossDrinks']['Icon'],
				label = Config.Locals['Targets']['GrabBossDrinks']['Label'],
				job = Config.Job,
				canInteract = function()
				 	if PlayerJob.isboss then
				 		return true
				 	else
				 		return false
				 	end
				end,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("Fruits", vector3(Config.Locations["Fruits"]["Coords"].x, Config.Locations["Fruits"]["Coords"].y, Config.Locations["Fruits"]["Coords"].z), 0.4, 0.4, {
		name = "Fruits",
		heading = Config.Locations["Fruits"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["Fruits"]["minZ"],
		maxZ = Config.Locations["Fruits"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:FruitsMenu",
				icon = Config.Locals['Targets']['Fruits']['Icon'],
				label = Config.Locals['Targets']['Fruits']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("GrabWater", vector3(Config.Locations["GrabWater"]["Coords"].x, Config.Locations["GrabWater"]["Coords"].y, Config.Locations["GrabWater"]["Coords"].z), 0.4, 0.4, {
		name = "GrabWater",
		heading = Config.Locations["GrabWater"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["GrabWater"]["minZ"],
		maxZ = Config.Locations["GrabWater"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:Grab",
				icon = Config.Locals['Targets']['GrabWater']['Icon'],
				label = Config.Locals['Targets']['GrabWater']['Label'],
				gdrinkname = "Water Cup",
				gdrink = "pwatercup",
				animationdict = "pickup_object",
				animation = "putdown_low",
				time = 3000,
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("GrabCoffee", vector3(Config.Locations["GrabCoffee"]["Coords"].x, Config.Locations["GrabCoffee"]["Coords"].y, Config.Locations["GrabCoffee"]["Coords"].z), 0.5, 0.2, {
		name = "GrabCoffee",
		heading = Config.Locations["GrabCoffee"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["GrabCoffee"]["minZ"],
		maxZ = Config.Locations["GrabCoffee"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:Grab",
				icon = Config.Locals['Targets']['GrabCoffee']['Icon'],
				label = Config.Locals['Targets']['GrabCoffee']['Label'],
				gdrinkname = "Coffee",
				gdrink = "coffee",
				animationdict = "anim@amb@clubhouse@bar@drink@base",
				animation = "idle_a",
				time = 5000,
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("Fridge", vector3(Config.Locations["Fridge"]["Coords"].x, Config.Locations["Fridge"]["Coords"].y, Config.Locations["Fridge"]["Coords"].z), 0.7, 0.7, {
		name = "Fridge",
		heading = Config.Locations["Fridge"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["Fridge"]["minZ"],
		maxZ = Config.Locations["Fridge"]["maxZ"],
	}, {
		options = { 
			{
				icon = Config.Locals['Targets']['Fridge']['Icon'],
				label = Config.Locals['Targets']['Fridge']['Label'],
				job = Config.Job,
				action = function()
					TriggerServerEvent("inventory:server:OpenInventory", "shop", "Fridge", Config.FridgeItems)
				end,
			},
		},
		distance = 1.2,
	})

	for k, v in pairs(Config.Locations["Lockers"]) do
        exports[Config.Target]:AddBoxZone("Locker"..k, vector3(v.coords.x, v.coords.y, v.coords.z), v.poly1, v.poly2, {
            name = "Locker"..k,
            heading = v.heading,
            debugPoly = Config.PolyZone,
            minZ = v.minZ,
            maxZ = v.maxZ,
            }, {
                options = { 
                {
                    type = "client",
					event = "qb-clothing:client:openMenu",
					icon = Config.Locals['Targets']['Lockers']['Icon'],
					label = Config.Locals['Targets']['Lockers']['Label'],
					job = Config.Job,
                }
            },
            distance = 1.2,
        })
    end

	exports[Config.Target]:AddBoxZone("PizzaThis-Bossmenu", vector3(Config.Locations["Bossmenu"]["Coords"].x, Config.Locations["Bossmenu"]["Coords"].y, Config.Locations["Bossmenu"]["Coords"].z), 1.2, 2.6, {
		name = "PizzaThis-Bossmenu",
		heading = Config.Locations["Bossmenu"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["Bossmenu"]["minZ"],
		maxZ = Config.Locations["Bossmenu"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "qb-bossmenu:client:OpenMenu",
				icon = Config.Locals['Targets']['Bossmenu']['Icon'],
				label = Config.Locals['Targets']['Bossmenu']['Label'],
				job = Config.Job,
				canInteract = function() 
					return PlayerJob.isboss
				end,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("Dough", vector3(Config.Locations["Dough"]["Coords"].x, Config.Locations["Dough"]["Coords"].y, Config.Locations["Dough"]["Coords"].z), 0.6, 0.6, {
		name = "Dough",
		heading = Config.Locations["Dough"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["Dough"]["minZ"],
		maxZ = Config.Locations["Dough"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:DoughMenu",
				icon = Config.Locals['Targets']['Dough']['Icon'],
				label = Config.Locals['Targets']['Dough']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	for k, v in pairs(Config.Locations["WineRacks"]) do
        exports[Config.Target]:AddBoxZone("WineRacks"..k, vector3(v.coords.x, v.coords.y, v.coords.z), v.poly1, v.poly2, {
            name = "WineRack"..k,
            heading = v.heading,
            debugPoly = Config.PolyZone,
            minZ = v.minZ,
            maxZ = v.maxZ,
            }, {
                options = { 
                {
                    type = "client",
					event = "CL-Pizzeria:WineRackMenu",
					icon = Config.Locals['Targets']['WineRacks']['Icon'],
					label = Config.Locals['Targets']['WineRacks']['Label'],
					job = Config.Job,
                }
            },
            distance = 1.2,
        })
	end

	exports[Config.Target]:AddBoxZone("PersonalStash", vector3(Config.Locations["PersonalStash"]["Coords"].x, Config.Locations["PersonalStash"]["Coords"].y, Config.Locations["PersonalStash"]["Coords"].z), 0.6, 1.2, {
		name = "PersonalStash",
		heading = Config.Locations["PersonalStash"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["PersonalStash"]["minZ"],
		maxZ = Config.Locations["PersonalStash"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:OpenPersonalStash",
				icon = Config.Locals['Targets']['PersonalStash']['Icon'],
				label = Config.Locals['Targets']['PersonalStash']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("DoughMachine", vector3(Config.Locations["DoughMachine"]["Coords"].x, Config.Locations["DoughMachine"]["Coords"].y, Config.Locations["DoughMachine"]["Coords"].z), 1.0, 0.6, {
		name = "DoughMachine",
		heading = Config.Locations["DoughMachine"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["DoughMachine"]["minZ"],
		maxZ = Config.Locations["DoughMachine"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:OpenDoughMachineMenu",
				icon = Config.Locals['Targets']['DoughMachine']['Icon'],
				label = Config.Locals['Targets']['DoughMachine']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("DoughPrepare", vector3(Config.Locations["DoughPrepare"]["Coords"].x, Config.Locations["DoughPrepare"]["Coords"].y, Config.Locations["DoughPrepare"]["Coords"].z), 0.6, 1.9, {
		name = "DoughPrepare",
		heading = Config.Locations["DoughPrepare"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["DoughPrepare"]["minZ"],
		maxZ = Config.Locations["DoughPrepare"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:OpenPrepareDoughMenu",
				icon = Config.Locals['Targets']['DoughPrepare']['Icon'],
				label = Config.Locals['Targets']['DoughPrepare']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("CoffeeCups", vector3(Config.Locations["CoffeeCups"]["Coords"].x, Config.Locations["CoffeeCups"]["Coords"].y, Config.Locations["CoffeeCups"]["Coords"].z), 0.5, 1.0, {
		name = "CoffeeCups",
		heading = Config.Locations["CoffeeCups"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["CoffeeCups"]["minZ"],
		maxZ = Config.Locations["CoffeeCups"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:CoffeeCupsMenu",
				icon = Config.Locals['Targets']['CoffeeCups']['Icon'],
				label = Config.Locals['Targets']['CoffeeCups']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.5,
	})

	exports[Config.Target]:AddBoxZone("FoodFridge", vector3(Config.Locations["FoodFridge"]["Coords"].x, Config.Locations["FoodFridge"]["Coords"].y, Config.Locations["FoodFridge"]["Coords"].z), 0.8, 1.3, {
		name = "FoodFridge",
		heading = Config.Locations["FoodFridge"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["FoodFridge"]["minZ"],
		maxZ = Config.Locations["FoodFridge"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:OpenFoodFridge",
				icon = Config.Locals['Targets']['FoodFridge']['Icon'],
				label = Config.Locals['Targets']['FoodFridge']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("CoffeeMachine", vector3(Config.Locations["CoffeeMachine"]["Coords"].x, Config.Locations["CoffeeMachine"]["Coords"].y, Config.Locations["CoffeeMachine"]["Coords"].z), 0.5, 0.7, {
		name = "CoffeeMachine",
		heading = Config.Locations["CoffeeMachine"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["CoffeeMachine"]["minZ"],
		maxZ = Config.Locations["CoffeeMachine"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:MainCoffeeMenu",
				icon = Config.Locals['Targets']['CoffeeMachine']['Icon'],
				label = Config.Locals['Targets']['CoffeeMachine']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.5,
	})

	exports[Config.Target]:AddBoxZone("DrinksMaker", vector3(Config.Locations["DrinksMaker"]["Coords"].x, Config.Locations["DrinksMaker"]["Coords"].y, Config.Locations["DrinksMaker"]["Coords"].z), 0.5, 0.7, {
		name = "DrinksMaker",
		heading = Config.Locations["DrinksMaker"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["DrinksMaker"]["minZ"],
		maxZ = Config.Locations["DrinksMaker"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:DrinksMakerMenu",
				icon = Config.Locals['Targets']['DrinksMaker']['Icon'],
				label = Config.Locals['Targets']['DrinksMaker']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.5,
	})

	for k, v in pairs(Config.Locations["Trays"]) do
        exports[Config.Target]:AddBoxZone("Tray"..k, vector3(v.coords.x, v.coords.y, v.coords.z), v.poly1, v.poly2, {
            name = "Tray"..k,
            heading = v.heading,
            debugPoly = Config.PolyZone,
            minZ = v.minZ,
            maxZ = v.maxZ,
            }, {
                options = { 
                {
					icon = Config.Locals['Targets']['Tray']['Icon'],
					label = Config.Locals['Targets']['Tray']['Label'],
					action = function()
						TriggerServerEvent("inventory:server:OpenInventory", "stash", "PizzaThis "..k.." Tray", {maxweight = 30000, slots = 10})
						TriggerEvent("inventory:client:SetCurrentStash", "PizzaThis "..k.." Tray") 
					end,
                }
            },
            distance = 1.2,
        })
    end

	exports[Config.Target]:AddBoxZone("MakePizza", vector3(Config.Locations["MakePizza"]["Coords"].x, Config.Locations["MakePizza"]["Coords"].y, Config.Locations["MakePizza"]["Coords"].z), 0.4, 0.4, {
		name = "MakePizza",
		heading = Config.Locations["MakePizza"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["MakePizza"]["minZ"],
		maxZ = Config.Locations["MakePizza"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:MakePizzaMenu",
				icon = Config.Locals['Targets']['MakePizza']['Icon'],
				label = Config.Locals['Targets']['MakePizza']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("MakePasta", vector3(Config.Locations["MakePasta"]["Coords"].x, Config.Locations["MakePasta"]["Coords"].y, Config.Locations["MakePasta"]["Coords"].z), 0.6, 0.7, {
		name = "MakePasta",
		heading = Config.Locations["MakePasta"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["MakePasta"]["minZ"],
		maxZ = Config.Locations["MakePasta"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:PastasMenu",
				icon = Config.Locals['Targets']['MakePasta']['Icon'],
				label = Config.Locals['Targets']['MakePasta']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("PizzaOven", vector3(Config.Locations["PizzaOven"]["Coords"].x, Config.Locations["PizzaOven"]["Coords"].y, Config.Locations["PizzaOven"]["Coords"].z), 0.6, 1.7, {
		name = "PizzaOven",
		heading = Config.Locations["PizzaOven"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["PizzaOven"]["minZ"],
		maxZ = Config.Locations["PizzaOven"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:CookPizzaMenu",
				icon = Config.Locals['Targets']['PizzaOven']['Icon'],
				label = Config.Locals['Targets']['PizzaOven']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})

	exports[Config.Target]:AddBoxZone("PizzaAddons", vector3(Config.Locations["PizzaAddons"]["Coords"].x, Config.Locations["PizzaAddons"]["Coords"].y, Config.Locations["PizzaAddons"]["Coords"].z), 0.6, 0.9, {
		name = "PizzaAddons",
		heading = Config.Locations["PizzaAddons"]["Heading"],
		debugPoly = Config.PolyZone,
		minZ = Config.Locations["PizzaAddons"]["minZ"],
		maxZ = Config.Locations["PizzaAddons"]["maxZ"],
	}, {
		options = { 
			{
				type = "client",
				event = "CL-Pizzeria:OpenAddonsShop",
				icon = Config.Locals['Targets']['PizzaAddons']['Icon'],
				label = Config.Locals['Targets']['PizzaAddons']['Label'],
				job = Config.Job,
			},
		},
		distance = 1.2,
	})
end)

----------------
----Menus
----------------
RegisterNetEvent('CL-Pizzeria:Garage:Menu', function()
	local GarageMenu = {
		{
			header = Config.Locals["Menus"]["Garage"]["MainMenu"]["MainHeader"],
			txt = Config.Locals["Menus"]["Garage"]["MainMenu"]["Text"],
			params = {
				event = "CL-Pizzeria:Catalog",
			}
		}
	}
	GarageMenu[#GarageMenu+1] = {
		header = Config.Locals["Menus"]["Garage"]["MainMenu"]["StoreVehicleHeader"],
		params = {
			event = "CL-Pizzeria:StoreVehicle"
		}
	}
	GarageMenu[#GarageMenu+1] = {
		header = Config.Locals["Menus"]["Garage"]["MainMenu"]["CloseMenuHeader"],
		params = {
			event = "qb-menu:client:closeMenu"
		}
	}
	exports['qb-menu']:openMenu(GarageMenu)
end)

RegisterNetEvent("CL-Pizzeria:Catalog", function()
    local VehicleMenu = {
        {
            header = Config.Locals["Menus"]["Garage"]["CatalogMenu"]["MainHeader"],
            isMenuHeader = true,
        }
    }
    for k, v in pairs(Config.Vehicles) do
        VehicleMenu[#VehicleMenu+1] = {
            header = v.vehiclename,
            txt = "Rent: " .. v.vehiclename .. " For: " .. v.price .. "$",
            params = {
                isServer = true,
                event = "CL-Pizzeria:TakeMoney",
                args = {
                    price = v.price,
                    vehiclename = v.vehiclename,
                    vehicle = v.vehicle
                }
            }
        }
    end
    VehicleMenu[#VehicleMenu+1] = {
        header = Config.Locals["Menus"]["Garage"]["CatalogMenu"]["GoBackHeader"],
        params = {
            event = "CL-Pizzeria:Garage:Menu"
        }
    }
    exports['qb-menu']:openMenu(VehicleMenu)
end)

RegisterNetEvent("CL-Pizzeria:DutyMenu", function()
    local DutyMenu = {
        {
            header = Config.Locals["Menus"]["Duty"]["MainHeader"],
            isMenuHeader = true,
        }
    }
	DutyMenu[#DutyMenu+1] = {
        header = Config.Locals["Menus"]["Duty"]["SecondHeader"],
		txt = Config.Locals["Menus"]["Duty"]["Text"],
        params = {
			isServer = true,
            event = "QBCore:ToggleDuty"
        }
    }
    DutyMenu[#DutyMenu+1] = {
        header = Config.Locals["Menus"]["Duty"]["CloseMenuHeader"],
        params = {
            event = "qb-menu:client:closemenu"
        }
    }
    exports['qb-menu']:openMenu(DutyMenu)
end)

RegisterNetEvent("CL-Pizzeria:GlassesMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local GlassesMenu = {
				{
					header = Config.Locals["Menus"]["Glasses"]["MainHeader"],
					isMenuHeader = true,
				}
			}
			for k, v in pairs(Config.Items["Glasses"]) do
				GlassesMenu[#GlassesMenu+1] = {
					header = v.image.." ┇ " ..v.glassname,
					txt = "Buy " .. v.glassname .. " For: " .. v.price .. "$",
					params = {
						isServer = true,
						event = "CL-Pizzeria:BuyGlass",
						args = {
							price = v.price,
							glassname = v.glassname,
							glass = v.glass
						}
					}
				}
			end
			GlassesMenu[#GlassesMenu+1] = {
				header = Config.Locals["Menus"]["Glasses"]["CloseMenuHeader"],
				params = {
					event = "qb-menu:client:closemenu"
				}
			}
			exports['qb-menu']:openMenu(GlassesMenu)
		else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
        end
    end)
end)

RegisterNetEvent("CL-Pizzeria:DrinksMachineMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local DrinksMenu = {
				{
					header = Config.Locals["Menus"]["DrinksMachine"]["MainHeader"],
					isMenuHeader = true,
				}
			}
            for k, v in pairs(Config.Items["Drinks"]) do
                DrinksMenu[#DrinksMenu+1] = {
                    header = v.image.." ┇ " ..v.drinkname,
                    txt = "Pour " .. v.drinkname .. "</br> Needed Glass: " .. v.glassname,
                    params = {
                        event = "CL-Pizzeria:MakeDrink",
                        args = {
                            glassname = v.glassname,
                            glass = v.glass,
                            drinkname = v.drinkname,
                            drink = v.drink,
                        }
                    }
                }
            end
			DrinksMenu[#DrinksMenu+1] = {
				header = Config.Locals["Menus"]["DrinksMachine"]["CloseMenuHeader"],
				params = {
					event = "qb-menu:client:closemenu"
				}
			}
			exports['qb-menu']:openMenu(DrinksMenu)
		else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
        end
    end)
end)

RegisterNetEvent("CL-Pizzeria:GrabDrinksMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local GrabDrinks = {
				{
					header = Config.Locals["Menus"]["GrabDrinks"]["MainHeader"],
					isMenuHeader = true,
				}
			}
			for k, v in pairs(Config.Items["GrabDrinks"]) do
				GrabDrinks[#GrabDrinks+1] = {
					header = v.image.." ┇ " ..v.drinkname,
					txt = "Grab " .. v.drinkname,
					params = {
						event = "CL-Pizzeria:Grab",
						args = {
							gdrinkname = v.drinkname,
							gdrink = v.drink,
							animationdict = "pickup_object",
							animation = "putdown_low",
							time = 3000,
						}
					}
				}
			end
			GrabDrinks[#GrabDrinks+1] = {
				header = Config.Locals["Menus"]["GrabDrinks"]["CloseMenuHeader"],
				params = {
					event = "qb-menu:client:closemenu"
				}
			}
			exports['qb-menu']:openMenu(GrabDrinks)
		else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
        end
    end)
end)

RegisterNetEvent("CL-Pizzeria:GrabBossDrinksMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local BossGrabDrinksMenu = {
				{
					header = Config.Locals["Menus"]["GrabBossDrinks"]["MainHeader"],
					isMenuHeader = true,
				}
			}
			for k, v in pairs(Config.Items["GrabBossDrinks"]) do
				BossGrabDrinksMenu[#BossGrabDrinksMenu+1] = {
					header = v.image.." ┇ " ..v.drinkname,
					txt = "Grab " .. v.drinkname,
					params = {
						event = "CL-Pizzeria:Grab",
						args = {
							gdrinkname = v.drinkname,
							gdrink = v.drink,
							animationdict = "pickup_object",
							animation = "putdown_low",
							time = 3000,
						}
					}
				}
			end
			BossGrabDrinksMenu[#BossGrabDrinksMenu+1] = {
				header = Config.Locals["Menus"]["GrabBossDrinks"]["CloseMenuHeader"],
				params = {
					event = "qb-menu:client:closemenu"
				}
			}
			exports['qb-menu']:openMenu(BossGrabDrinksMenu)
		else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
        end
    end)
end)

RegisterNetEvent("CL-Pizzeria:FruitsMenu", function()
    local FruitsMenu = {
        {
            header = Config.Locals["Menus"]["Fruits"]["MainHeader"],
            isMenuHeader = true,
        }
    }
	for k, v in pairs(Config.Items["Fruits"]) do
		FruitsMenu[#FruitsMenu+1] = {
			header = v.image.." ┇ " ..v.fruitname,
			txt = "Grab " .. v.fruitname,
			params = {
				event = "CL-Pizzeria:Grab",
				args = {
					gdrinkname = v.fruitname,
					gdrink = v.fruit,
					animationdict = "anim@amb@clubhouse@bar@drink@one",
					animation = "one_player",
					time = 4500,
				}
			}
		}
	end
    FruitsMenu[#FruitsMenu+1] = {
        header = Config.Locals["Menus"]["Fruits"]["CloseMenuHeader"],
        params = {
            event = "qb-menu:client:closemenu"
        }
    }
    exports['qb-menu']:openMenu(FruitsMenu)
end)

RegisterNetEvent("CL-Pizzeria:DoughMenu", function()
    local DoughMenu = {
        {
            header = Config.Locals["Menus"]["Dough"]["MainHeader"],
            isMenuHeader = true,
        }
    }
	if dough >= 1 then
		DoughMenu[#DoughMenu+1] = {
			header = Config.Locals["Menus"]["Dough"]["SecondHeader"],
			txt = "Current Available Dough: "..dough,
			params = {
				event = "CL-Pizzeria:Grab",
				args = {
					gdrinkname = "Dough",
					gdrink = "pdough",
					animationdict = "anim@amb@clubhouse@bar@drink@one",
					animation = "one_player",
					time = 4700,
					dough = true,
				}
			}
		}
		DoughMenu[#DoughMenu+1] = {
			header = Config.Locals["Menus"]["Dough"]["ThirdHeader"],
			txt = Config.Locals["Menus"]["Dough"]["ThirdText"],
			params = {
				event = "CL-Pizzeria:AddDough"
			}
		}
	else
		DoughMenu[#DoughMenu+1] = {
			header = Config.Locals["Menus"]["Dough"]["FourthHeader"],
			txt = Config.Locals["Menus"]["Dough"]["FourthText"],
			params = {
				event = "CL-Pizzeria:AddDough",
			}
		}
	end
    DoughMenu[#DoughMenu+1] = {
        header = Config.Locals["Menus"]["Dough"]["CloseMenuHeader"],
        params = {
            event = "qb-menu:client:closemenu"
        }
    }
    exports['qb-menu']:openMenu(DoughMenu)
end)

RegisterNetEvent("CL-Pizzeria:WineRackMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local WineRack = {
				{
					header = Config.Locals["Menus"]["WineRack"]["MainHeader"],
					isMenuHeader = true,
				}
			}
			for k, v in pairs(Config.Items["WineRack"]) do
				WineRack[#WineRack+1] = {
					header = v.image.." ┇ " ..v.winename,
					txt = "Grab " .. v.winename,
					params = {
						event = "CL-Pizzeria:Grab",
						args = {
							gdrinkname = v.winename,
							gdrink = v.wine,
							animationdict = "pickup_object",
							animation = "putdown_low",
							time = 3000,
						}
					}
				}
			end
			WineRack[#WineRack+1] = {
				header = Config.Locals["Menus"]["WineRack"]["CloseMenuHeader"],
				params = {
					event = "qb-menu:client:closemenu"
				}
			}
			exports['qb-menu']:openMenu(WineRack)
		else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
        end
    end)
end)

RegisterNetEvent("CL-Pizzeria:OpenDoughMachineMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local DoughMachineMenu = {
				{
					header = Config.Locals["Menus"]["DoughMachine"]["MainHeader"],
					isMenuHeader = true,
				}
			}
			DoughMachineMenu[#DoughMachineMenu+1] = {
				header =  "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978962983516508170/pbigdough.png width=30px> ".." ┇ Pizza Dough",
				txt = "Ingredients: <br> - Pizza Flour <br> - Water <br> - Salt <br> - Oil",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "PizzaDough",
						time = 5000,
						itemname = "Pizza Dough",
						item2 = "pwater",
						item3 = "poil",
						item4 = "psalt",
						item5 = "ppizzaflour",	
						number = 2,
						recieveitem = "pbigdough",
						animdict = "mini@repair",
						anim = "fixing_a_player",
					}
				}
			}
			DoughMachineMenu[#DoughMachineMenu+1] = {
				header = Config.Locals["Menus"]["DoughMachine"]["CloseMenuHeader"],
				params = {
					event = "qb-menu:client:closemenu"
				}
			}
			exports['qb-menu']:openMenu(DoughMachineMenu)
		else
			QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
		end
	end)
end)

RegisterNetEvent("CL-Pizzeria:OpenPrepareDoughMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local PrepareDoughMenu = {
				{
					header = Config.Locals["Menus"]["PrepareDough"]["MainHeader"],
					isMenuHeader = true,
				}
			}
			PrepareDoughMenu[#PrepareDoughMenu+1] = {
				header =  "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979013867856338955/pdough.png width=30px> ".." ┇  Ready Pizza Dough",
				txt = "Ingredients: <br> - Pizza Dough",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						qbcoreevent = true,
						qbcoreitem = "pbigdough",
						time = 5000,
						itemname = "Pizza Dough",
						item2 = "pbigdough",
						recieveitem = "pdough",
						number = 4,
						animdict = "anim@amb@business@coc@coc_unpack_cut@",
						anim = "fullcut_cycle_v6_cokecutter",
					}
				}
			}
			PrepareDoughMenu[#PrepareDoughMenu+1] = {
				header = Config.Locals["Menus"]["PrepareDough"]["CloseMenuHeader"],
				params = {
					event = "qb-menu:client:closemenu"
				}
			}
			exports['qb-menu']:openMenu(PrepareDoughMenu)
		else
			QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
		end
	end)
end)

RegisterNetEvent("CL-Pizzeria:CoffeeCupsMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local CoffeeCupsMenu = {
				{
					header = Config.Locals["Menus"]["CoffeeCups"]["MainHeader"],
					isMenuHeader = true,
				}
			}
			for k, v in pairs(Config.Items["CoffeeCups"]) do
				CoffeeCupsMenu[#CoffeeCupsMenu+1] = {
					header = v.image.." ┇ " ..v.glassname,
					txt = "Buy " .. v.glassname .. " For: " .. v.price .. "$",
					params = {
						isServer = true,
						event = "CL-Pizzeria:BuyGlass",
						args = {
							price = v.price,
							glassname = v.glassname,
							glass = v.glass
						}
					}
				}
			end
			CoffeeCupsMenu[#CoffeeCupsMenu+1] = {
				header = Config.Locals["Menus"]["CoffeeCups"]["CloseMenuHeader"],
				params = {
					event = "qb-menu:client:closemenu"
				}
			}
			exports['qb-menu']:openMenu(CoffeeCupsMenu)
		else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
        end
    end)
end)

RegisterNetEvent("CL-Pizzeria:MainCoffeeMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local MainCoffeeMenu = {
				{
					header = "Coffee's",
					isMenuHeader = true,
				}
			}
			MainCoffeeMenu[#MainCoffeeMenu+1] = {
				header = "<img src=https://cdn.discordapp.com/attachments/926465631770005514/963446697059553351/unknown.png width=30px> ".." ┇ Espresso Macchiato",
				txt = "Ingredients: <br> - Espresso Coffee Glass <br> - Milk <br> - Coffee Beans",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "EspressoMacchiato",
						number = 2,
						time = 5000,
						item2 = "pmilk",
						item3 = "pcoffeebeans",
						item4 = "pespressocoffeecup",	
						itemname = "Espresso Macchiato",
						recieveitem = "pespressomacchiato",
						animdict = "anim@amb@nightclub@mini@drinking@bar@player_bartender@two",
						anim = "two_player",
					}            
				}
			}
			MainCoffeeMenu[#MainCoffeeMenu+1] = {
				header = "<img src=https://cdn.discordapp.com/attachments/930069494066475008/945394895328268419/caremel_frappucino.png width=30px> ".." ┇ Caramel Frappucino",
				txt = "Ingredients: <br> - High Coffee Glass <br> - Milk <br> - Coffee Beans <br> - Whipped Cream <br> - Caramel Syrup",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "CaramelFrappucino",
						number = 2,
						time = 5000,
						item2 = "pmilk",
						item3 = "pcoffeebeans",
						item4 = "pcream",
						item5 = "pcaramelsyrup",
						item6 = "phighcoffeeglasscup",	
						itemname = "Caramel Frappucino",
						recieveitem = "pcaramelfrappucino",
						animdict = "anim@amb@nightclub@mini@drinking@bar@player_bartender@two",
						anim = "two_player",
					}        
				}
			}
			MainCoffeeMenu[#MainCoffeeMenu+1] = {
				header = "<img src=https://cdn.discordapp.com/attachments/930069494066475008/945394893474398238/cold_brew_latte.png width=30px> ".." ┇ Cold Brew Latte",
				txt = "Ingredients: <br> - High Coffee Glass <br> - Milk <br> - Coffee Beans",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "ColdBrewLatte",
						number = 2,
						time = 5000,
						item2 = "pmilk",
						item3 = "pcoffeebeans",
						item4 = "phighcoffeeglasscup",	
						itemname = "Cold Brew Latte",
						recieveitem = "pcoldbrewlatte",
						animdict = "anim@amb@nightclub@mini@drinking@bar@player_bartender@two",
						anim = "two_player",
					}           
				}
			}
			MainCoffeeMenu[#MainCoffeeMenu+1] = {
				header = "<img src=https://cdn.discordapp.com/attachments/930069494066475008/945394940282798201/strawberry_vanilla_oat_latte.png width=30px> ".." ┇ Strawberry Vanilla Oat Latte",
				txt = "Ingredients: <br> - Coffee Glass <br> - Milk <br> - Coffee Beans",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "StrawberryVanillaOatLatte",
						number = 2,
						time = 5000,
						item2 = "pmilk",
						item3 = "pcoffeebeans",
						item4 = "pcoffeeglass",	
						itemname = "Strawberry Vanilla Oat Latte",
						recieveitem = "pstrawberryvanillaoatlatte",
						animdict = "anim@amb@nightclub@mini@drinking@bar@player_bartender@two",
						anim = "two_player",
					}           
				}
			}
			MainCoffeeMenu[#MainCoffeeMenu+1] = {
				header = "⬅ Close",
				params = {
					event = "qb-menu:client:closemenu",
				}
			}
			exports['qb-menu']:openMenu(MainCoffeeMenu)
		else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
        end
    end)
end)

RegisterNetEvent("CL-Pizzeria:DrinksMakerMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local DrinksMakerMenu = {
				{
					header = Config.Locals["Menus"]["DrinksMaker"]["MainHeader"],
					isMenuHeader = true,
				}
			}
			for k, v in pairs(Config.Items["DrinksMaker"]) do
				DrinksMakerMenu[#DrinksMakerMenu+1] = {
					header = v.image.." ┇ " ..v.drinkname,
					txt = "Grab " .. v.drinkname,
					params = {
						event = "CL-Pizzeria:Grab",
						args = {
							gdrinkname = v.drinkname,
							gdrink = v.drink,
							animationdict = "anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal",
							animation = "idle",
							time = 2700,
						}
					}
				}
			end
			DrinksMakerMenu[#DrinksMakerMenu+1] = {
				header = Config.Locals["Menus"]["DrinksMaker"]["CloseMenuHeader"],
				params = {
					event = "qb-menu:client:closemenu"
				}
			}
			exports['qb-menu']:openMenu(DrinksMakerMenu)
		else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
        end
    end)
end)

RegisterNetEvent("CL-Pizzeria:MakePizzaMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local MakePizzaMenu = {
				{
					header = Config.Locals["Menus"]["MakePizza"]["MainHeader"],
					isMenuHeader = true,
				}
			}
			MakePizzaMenu[#MakePizzaMenu+1] = {
				header =  "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979143892106629170/ppizzabase.png width=30px> ".." ┇ Pizza Base",
				txt = "Ingredients: <br> - Pizza Dough <br> - Pizza Flour <br> - Tomato Souce",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "PizzaBase",
						time = 7000,
						itemname = "Pizza Base",
						item2 = "pdough",
						item3 = "ppizzaflour",
						item4 = "ptomatosouce",
						number = 1,
						recieveitem = "ppizzabase",
						animdict = "mini@repair",
						anim = "fixing_a_ped",
					}
				}
			}
			MakePizzaMenu[#MakePizzaMenu+1] = {
				header = Config.Locals["Menus"]["MakePizza"]["CloseMenuHeader"],
				params = {
					event = "qb-menu:client:closemenu"
				}
			}
			exports['qb-menu']:openMenu(MakePizzaMenu)
		else
			QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
		end
	end)
end)

RegisterNetEvent("CL-Pizzeria:CookPizzaMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local CookPizzaMenu = {
				{
					header = Config.Locals["Menus"]["Pizzas"]["MainHeader"],
					isMenuHeader = true,
				}
			}
			CookPizzaMenu[#CookPizzaMenu+1] = {
				header = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979152201584881704/pmargharita.png width=30px> ".." ┇ Cook Margharita Pizza",
				txt = "Ingredients: <br> - Pizza Base <br> - Basil <br> - Mozzarella <br> - Olive Oil <br> - Salt",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "MargharitaPizza",
						number = 1,
						time = 8000,
						item2 = "pbasil",
						item3 = "pmozzarella",
						item4 = "poil",	
						item5 = "psalt",
						item6 = "ppizzabase",
						itemname = "Margharita Pizza",
						recieveitem = "pmargharita",
						animdict = "anim@amb@business@meth@meth_monitoring_no_work@",
						anim = "base_lazycook",
					}            
				}
			}
			CookPizzaMenu[#CookPizzaMenu+1] = {
				header = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979340823177093140/pnapollitano.png width=30px> ".." ┇ Cook Napollitano Pizza",
				txt = "Ingredients: <br> - Pizza Base <br> - Basil <br> - Mozzarella <br> - Salt",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "NapollitanoPizza",
						number = 1,
						time = 8000,
						item2 = "pbasil",
						item3 = "pmozzarella",
						item4 = "psalt",
						item5 = "ppizzabase",
						itemname = "Napollitano Pizza",
						recieveitem = "pnapollitano",
						animdict = "anim@amb@business@meth@meth_monitoring_no_work@",
						anim = "base_lazycook",
					}            
				}
			}
			CookPizzaMenu[#CookPizzaMenu+1] = {
				header = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979344270425198612/pmushroomspizza.png width=30px> ".." ┇ Cook Pungi Pizza",
				txt = "Ingredients: <br> - Pizza Base <br> - Butter <br> - Mozzarella <br> - Olive Oil <br> - Mushrooms",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "MushroomsPizza",
						number = 1,
						time = 8000,
						item2 = "pbutter",
						item3 = "pmozzarella",
						item4 = "poil",
						item5 = "ppizzabase",
						item6 = "pmushrooms",
						itemname = "Mushrooms Pizza",
						recieveitem = "pmushroomspizza",
						animdict = "anim@amb@business@meth@meth_monitoring_no_work@",
						anim = "base_lazycook",
					}            
				}
			}
			CookPizzaMenu[#CookPizzaMenu+1] = {
				header = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979349165568041020/pseafood.png width=30px> ".." ┇ Cook Seafood Pizza",
				txt = "Ingredients: <br> - Pizza Base <br> - Seafood Mix <br> - Mozzarella <br> - Basil <br> - Salt",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "SeafoodPizza",
						number = 1,
						time = 8000,
						item2 = "pseafoodmix",
						item3 = "pmozzarella",
						item4 = "pbasil",
						item5 = "ppizzabase",
						item6 = "psalt",
						itemname = "Seafood Pizza",
						recieveitem = "pseafood",
						animdict = "anim@amb@business@meth@meth_monitoring_no_work@",
						anim = "base_lazycook",
					}            
				}
			}
			CookPizzaMenu[#CookPizzaMenu+1] = {
				header = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979373569358319616/pvegpizza.png width=30px> ".." ┇ Cook Vegetarian Pizza",
				txt = "Ingredients: <br> - Pizza Base <br> - Tomatoes <br> - Vegetarian Cheese <br> - Basil <br> - Salt",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "VegetarianPizza",
						number = 1,
						time = 8000,
						item2 = "ptomatoes",
						item3 = "pvegicheese",
						item4 = "pbasil",
						item5 = "ppizzabase",
						item6 = "psalt",
						itemname = "Vegetarian Pizza",
						recieveitem = "pvegpizza",
						animdict = "anim@amb@business@meth@meth_monitoring_no_work@",
						anim = "base_lazycook",
					}            
				}
			}
			CookPizzaMenu[#CookPizzaMenu+1] = {
				header = Config.Locals["Menus"]["Pizzas"]["CloseMenuHeader"],
				params = {
					event = "qb-menu:client:closemenu",
				}
			}
			exports['qb-menu']:openMenu(CookPizzaMenu)
		else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
        end
    end)
end)

RegisterNetEvent("CL-Pizzeria:PastasMenu", function()
	QBCore.Functions.TriggerCallback('CL-Pizzeria:CheckDuty', function(result)
        if result then
			local PastasMenu = {
				{
					header = Config.Locals["Menus"]["Pastas"]["MainHeader"],
					isMenuHeader = true,
				}
			}
			PastasMenu[#PastasMenu+1] = {
				header = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979434168859631686/pmacncheese.png width=30px> ".." ┇ Cook Mac N Cheese",
				txt = "Ingredients: <br> - Elbow Macaroni <br> - Butter <br> - Milk <br> - Cheddar Cheese <br> - Parmesan Cheese",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "MacNCheese",
						number = 1,
						time = 8000,
						item2 = "pelbowmacaroni",
						item3 = "pbutter",
						item4 = "pmilk",	
						item5 = "pcheddarcheese",
						item6 = "pparmesancheese",
						itemname = "Mac N Cheese",
						recieveitem = "pmacncheese",
						animdict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@",
						anim = "chemical_pour_long_cooker",
					}            
				}
			}
			PastasMenu[#PastasMenu+1] = {
				header = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979436658132918372/pbbqporkmac.png width=30px> ".." ┇ Cook BBQ Pork Mac",
				txt = "Ingredients: <br> - Pork Meat <br> - Elbow Macaroni <br> - Milk <br> - Cheddar Cheese <br> - BBQ Souce",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "BBQPorkMac",
						number = 1,
						time = 8000,
						item2 = "pporkmeat",
						item3 = "pelbowmacaroni",
						item4 = "pmilk",	
						item5 = "pcheddarcheese",
						item6 = "pbbqsouce",
						itemname = "BBQ Pork Mac",
						recieveitem = "pbbqporkmac",
						animdict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@",
						anim = "chemical_pour_long_cooker",
					}            
				}
			}
			PastasMenu[#PastasMenu+1] = {
				header = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979439685174710392/pfresca.png width=30px> ".." ┇ Cook Pasta Fresca",
				txt = "Ingredients: <br> - Regular Pasta <br> - Olive Oil <br> - Tomatoes <br> - Seafood Mix",
				params = {
					event = "CL-Pizzeria:Make",
					args = {
						eventname = "PastaFresca",
						number = 1,
						time = 8000,
						item2 = "pregularpasta",
						item3 = "poliveoil",
						item4 = "ptomatoes",
						item5 = "pseafoodmix",
						itemname = "Pasta Fresca",
						recieveitem = "pfresca",
						animdict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@",
						anim = "chemical_pour_long_cooker",
					}            
				}
			}
			PastasMenu[#PastasMenu+1] = {
				header = Config.Locals["Menus"]["Pastas"]["CloseMenuHeader"],
				params = {
					event = "qb-menu:client:closemenu",
				}
			}
			exports['qb-menu']:openMenu(PastasMenu)
		else
            QBCore.Functions.Notify(Config.Locals["Notifications"]["MustBeOnDuty"], "error")
        end
    end)
end)

----------------
----Functions
----------------
function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function AlcoholEffect()
	local Player = PlayerPedId()
	StartScreenEffect("MinigameEndTrevor", 1.0, 0)
    Citizen.Wait(5000)
    StopScreenEffect("MinigameEndTrevor")
end

function LoadModel(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		Wait(10)
	end
end

function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

function SpawnClipBoard()
	for k, v in pairs(Config.DutyObjects) do
		LoadModel(v.model)
		local Model = CreateObject(GetHashKey(v.model), v.coords.x, v.coords.y, v.coords.z, true)
		SetEntityHeading(Model, v.heading)
		FreezeEntityPosition(Model, true)
		ClipBoardSpawned = true
	end
end