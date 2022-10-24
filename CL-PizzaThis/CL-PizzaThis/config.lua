Config = Config or {}

Config.Job = 'pizzeria' -- Name for the job that can access the target etc 

Config.UseBlips = true -- Set to false to disable blips

Config.MaxInventoryWeight = 120000 -- Set that to your max inventory weight, by defualt 120000

Config.PolyZone = false -- Set to true to activate polygon zones

Config.ConsumablesVersion = "new" -- Not sure if its got updated buut i noticed that QBCore:Server:SetMetaData isnt working anymore, If you still want to use this event change it to : "old"

Config.Target = 'qb-target' -- Name for the target

Config.WashingHandsStress = 3.0 -- How much stress is decreased when washing hands

Config.MarkerDistance = 5.0 -- How much distance from the marker will the player be able to interact with the garage? more = more MS less = less MS

Config.Thirst = {
    Champagne = 10,
    Beer = 3,
    RedWine = 5,
    WhiteWine = 5,
    PinkWine = 5,
    Whiskey = 6,
    GoldSake = 6,
    Rum = 2,
    WhiteWineBottle = 7,
    WhiskeyBottle = 7,
    WaterCup = 13,
    RedWineBottle = 16,
    SparklingBottle = 16,
    CastelloBrolioBottle = 16,
    GaryReffelBottle = 16,
    RutherfordHillBottle = 16,
    PinkWineBottle = 16,
    EspressoMacchiato = 8,
    CaramelFrappucino = 8,
    ColdbrewLatte = 8,
    StrawberryVanillaOatLatte = 8,
    CocaCola = 7,
    DRPepper = 7,
    Sprite = 7,
}

Config.Hunger = {
    Banana = 6,
    Apple = 4,
    Orange = 5,
    PizzaMargharita = 25,
    PizzaNapollitano = 25,
    PizzaFungi = 25,
    PizzaSeafood = 25,
    VegetarianPizza = 10,
    MacNCheese = 15,
    BBQPorkMac = 15,
    PastaFresca = 15,
}

--Vehicles, you can add as many as you like.
Config.Vehicles = {
    [1] = {
        ['vehiclename'] = "Baller", -- Name
        ['vehicle'] = "baller", -- Model To Spawn
        ['price'] = 5500, -- Price
    }, 
    [2] = {
        ['vehiclename'] = "Pony", -- Name
        ['vehicle'] = "pony", -- Model To Spawn
        ['price'] = 2500, -- Price
    }, 
}

Config.DutyObjects = {
    [1] = {
        ['model'] = "p_amb_clipboard_01", -- Model To Spawn
        ['coords'] = vector3(812.42199, -755.81111, 27.274909),
        ['heading'] = 180.11533,
    }, 
    [2] = {
        ['model'] = "prop_cd_paper_pile1", -- Model To Spawn
        ['coords'] = vector3(812.12199, -755.81111, 27.164909),
        ['heading'] = 180.11533,
    }, 
}

Config.Locations = {
    General = {
        Blips = {
            [1] = {
                Title = "Pizzeria", 
                BlipColour = 1, 
                BlipId = 267,
                Coords = vector3(804.35949, -750.9271, 26.78083)
            },
        },
    },
    
    Garage = {
        Marker = vector3(809.99035, -732.4, 27.5977),
    },
    
    Shop = {
        Coords = vector3(812.14477, -755.5136, 26.463903),
        Heading = 180.11533,
        minZ = 25.263903,
        maxZ = 26.63333,
    },

    Stash = {
        Coords = vector3(811.46392, -751.2053, 26.463903),
        Heading = 90.118133,
        minZ = 25.263903,
        maxZ = 26.63333,
    },

    Glasses = {
        Coords = vector3(813.85162, -751.1357, 26.881879),
        Heading = 269.55291,
        minZ = 25.881879,
        maxZ = 27.881879,
    },

    DrinksMachine = {
        Coords = vector3(814.07141, -749.3648, 26.881879),
        Heading = 269.55291,
        minZ = 26.781879,
        maxZ = 27.981879,
    },

    GrabDrinks = {
        Coords = vector3(814.07141, -749.3648, 26.881879),
        Heading = 269.55291,
        minZ = 25.781879,
        maxZ = 26.881879,
    },

    BossStash = {
        Coords = vector3(796.51977, -748.8645, 31.013879),
        Heading = 1.4484326,
        minZ = 29.913879,
        maxZ = 31.613879,
    },

    GrabBossDrinks = {
        Coords = vector3(801.39257, -748.9908, 30.792514),
        Heading = 343.81393,
        minZ = 30.592514,
        maxZ = 30.992514,
    },

    GrabWater = {
        Coords = vector3(799.15822, -758.6823, 30.792514),
        Heading = 0.0698692,
        minZ = 29.792514,
        maxZ = 31.792514,
    },

    GrabCoffee = {
        Coords = vector3(800.29453, -758.665, 30.792514),
        Heading = 0.0698692,
        minZ = 29.792514,
        maxZ = 31.792514,
    },

    Fruits = {
        Coords = vector3(802.79199, -761.087, 31.232946),
        Heading = 266.65414,
        minZ = 30.232946,
        maxZ = 32.232946,
    },

    Fridge = {
        Coords = vector3(799.77284, -758.8344, 30.792514),
        Heading = 0.0698692,
        minZ = 29.792514,
        maxZ = 32.092514,
    },

    Duty = {
        Coords = vector3(812.27212, -755.9404, 27.12779),
        Heading = 180.11533,
        minZ = 26.99999,
        maxZ = 27.62779,
    },

    Dough = {
        Coords = vector3(811.51123, -755.6045, 26.630836),
        Heading = 180.11533,
        minZ = 26.630836,
        maxZ = 26.930836,
    },

    PersonalStash = {
        Coords = vector3(811.37243, -764.3569, 31.265888),
        Heading = 272.32495,
        minZ = 30.265886,
        maxZ = 32.265886,
    },

    DoughMachine = {
        Coords = vector3(806.12829, -757.4082, 27.458053),
        Heading = 46.859565,
        minZ = 26.033151,
        maxZ = 27.633151,
    },

    DoughPrepare = {
        Coords = vector3(807.66705, -756.9855, 27.458053),
        Heading = 359.9,
        minZ = 26.033151,
        maxZ = 27.033151,
    },

    CoffeeCups = {
        Coords = vector3(811.41735, -764.5887, 28.06981),
        Heading = 271.41192,
        minZ = 27.56981,
        maxZ = 28.17981,
    },

    FoodFridge = {
        Coords = vector3(805.59539, -761.7076, 26.780834),
        Heading = 90.636985,
        minZ = 25.780834,
        maxZ = 27.780834,
    },

    CoffeeMachine = {
        Coords = vector3(811.41735, -764.3987, 26.56981),
        Heading = 271.41192,
        minZ = 26.56981,
        maxZ = 27.17981,
    },

    DrinksMaker = {
        Coords = vector3(811.41735, -765.200, 26.56981),
        Heading = 271.41192,
        minZ = 26.56981,
        maxZ = 27.17981,
    },

    MakePizza = {
        Coords = vector3(811.41123, -754.5045, 26.630836),
        Heading = 180.11533,
        minZ = 26.630836,
        maxZ = 26.930836,
    },

    MakePasta = {
        Coords = vector3(808.33131, -760.2289, 26.703075),
        Heading = 180.30313,
        minZ = 25.703075,
        maxZ = 27.703075,
    },

    PizzaOven = {
        Coords = vector3(813.95566, -752.9314, 27.080839),
        Heading = 270.20068,
        minZ = 26.780839,
        maxZ = 27.780839,
    },

    PizzaAddons = {
        Coords = vector3(812.31123, -755.6045, 26.630836),
        Heading = 180.11533,
        minZ = 26.630836,
        maxZ = 26.930836,
    },

    WashHands = {
        [1] = {
            ['coords'] = vector3(813.39843, -755.5438, 26.630836),
            ['heading'] = 180.11533,
            ['minZ'] = 25.630836,
            ['maxZ'] = 27.630836,
            ['poly1'] = 0.5,
            ['poly2'] = 0.5,
        },
        [2] = {
            ['coords'] = vector3(801.58837, -758.7001, 31.23454),
            ['heading'] = 0.0698692,
            ['minZ'] = 30.23454,
            ['maxZ'] = 32.23454,
            ['poly1'] = 0.5,
            ['poly2'] = 0.5,
        },
        [3] = {
            ['coords'] = vector3(809.26147, -760.0004, 26.703075),
            ['heading'] = 89.754257,
            ['minZ'] = 25.703075,
            ['maxZ'] = 27.703075,
            ['poly1'] = 0.5,
            ['poly2'] = 0.5,
        },
        [4] = {
            ['coords'] = vector3(809.33148, -765.1442, 25.820392),
            ['heading'] = 176.30313,
            ['minZ'] = 24.820392,
            ['maxZ'] = 26.820392,
            ['poly1'] = 0.5,
            ['poly2'] = 0.5,
        },
        [5] = {
            ['coords'] = vector3(809.90405, -765.3858, 30.946973),
            ['heading'] = 179.24341,
            ['minZ'] = 29.946973,
            ['maxZ'] = 31.946973,
            ['poly1'] = 0.5,
            ['poly2'] = 0.5,
        },
        [6] = {
            ['coords'] = vector3(808.90405, -765.3858, 30.946973),
            ['heading'] = 179.24341,
            ['minZ'] = 29.946973,
            ['maxZ'] = 31.946973,
            ['poly1'] = 0.5,
            ['poly2'] = 0.5,
        },
    },

    Lockers = {
        [1] = {
            ['coords'] = vector3(808.77343, -758.2884, 31.265886),
            ['heading'] = 358.58792,
            ['minZ'] = 30.265886,
            ['maxZ'] = 32.265886,
            ['poly1'] = 0.6,
            ['poly2'] = 2.8,
        },
        [2] = {
            ['coords'] = vector3(812.17712, -758.299, 31.265886),
            ['heading'] = 358.58792,
            ['minZ'] = 30.265886,
            ['maxZ'] = 32.265886,
            ['poly1'] = 0.6,
            ['poly2'] = 2.8,
        },
        [3] = {
            ['coords'] = vector3(812.83053, -762.8221, 31.265886),
            ['heading'] = 358.58792,
            ['minZ'] = 30.265886,
            ['maxZ'] = 32.265886,
            ['poly1'] = 0.6,
            ['poly2'] = 2.0,
        },
    },

    WineRacks = {
        [1] = {
            ['coords'] = vector3(809.37055, -761.8726, 23.163036),
            ['heading'] = 180.30313,
            ['minZ'] = 21.163036,
            ['maxZ'] = 22.663036,
            ['poly1'] = 0.6,
            ['poly2'] = 1.9,
        },
        [2] = {
            ['coords'] = vector3(807.26055, -761.8726, 23.163036),
            ['heading'] = 180.30313,
            ['minZ'] = 21.163036,
            ['maxZ'] = 22.663036,
            ['poly1'] = 0.6,
            ['poly2'] = 1.9,
        },
    },

    Trays = {
        [1] = {
            ['coords'] = vector3(807.0600, -751.5258, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.0,
            ['poly2'] = 1.0,
        },
        [2] = {
            ['coords'] = vector3(803.0600, -751.5258, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.0,
            ['poly2'] = 1.0,
        },
        [3] = {
            ['coords'] = vector3(799.0600, -751.5258, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.0,
            ['poly2'] = 1.0,
        },
        [4] = {
            ['coords'] = vector3(795.2600, -751.5258, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.0,
            ['poly2'] = 1.0,
        },
        [5] = {
            ['coords'] = vector3(798.00945, -748.9505, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.0,
            ['poly2'] = 1.0,
        },
        [6] = {
            ['coords'] = vector3(799.47099, -755.0499, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.0,
            ['poly2'] = 1.0,
        },
        [7] = {
            ['coords'] = vector3(797.85418, -747.1892, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.0,
            ['poly2'] = 1.0,
        },
        [8] = {
            ['coords'] = vector3(798.26707, -741.2734, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.0,
            ['poly2'] = 1.0,
        },
        [9] = {
            ['coords'] = vector3(804.62297, -741.2214, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.0,
            ['poly2'] = 1.0,
        },
        [10] = {
            ['coords'] = vector3(810.1200, -741.2319, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.0,
            ['poly2'] = 1.0,
        },
        [11] = {
            ['coords'] = vector3(811.1000, -747.138, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.0,
            ['poly2'] = 1.0,
        },
        [12] = {
            ['coords'] = vector3(807.70393, -754.8479, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 0.7,
            ['poly2'] = 1.8,
        },
        [13] = {
            ['coords'] = vector3(805.60393, -754.8479, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 0.7,
            ['poly2'] = 1.8,
        },
        [14] = {
            ['coords'] = vector3(803.50393, -754.8479, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 0.7,
            ['poly2'] = 1.8,
        },
        [15] = {
            ['coords'] = vector3(801.40393, -754.8479, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 0.7,
            ['poly2'] = 1.8,
        },
        [16] = {
            ['coords'] = vector3(799.23701, -757.6118, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.3,
            ['poly2'] = 0.7,
        },
        [17] = {
            ['coords'] = vector3(799.23701, -759.7118, 26.834445),
            ['heading'] = 90.03369,
            ['minZ'] = 26.334445,
            ['maxZ'] = 26.634445,
            ['poly1'] = 1.3,
            ['poly2'] = 0.7,
        },
        [18] = {
            ['coords'] = vector3(809.94488, -758.525, 22.153968),
            ['heading'] = 90.03369,
            ['minZ'] = 21.934445,
            ['maxZ'] = 22.070,
            ['poly1'] = 1.2,
            ['poly2'] = 1.2,
        },
    },
}

Config.Items = {
    Glasses = {
        [1] = {
            ['glass'] = 'pwineglass',
            ['glassname'] = 'Wine Glass',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/977942404617367602/pwineglass.png width=30px>",
            ['price'] = 50,
        }, 
        [2] = {
            ['glass'] = 'pwhiskyglass',
            ['glassname'] = 'Whisky Glass',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/977942404038541332/pwhiskyglass.png width=30px>",
            ['price'] = 20,
        }, 
        [3] = {
            ['glass'] = 'pbeermug',
            ['glassname'] = 'Beer Mug',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/977942405015822337/pbeermug.png  width=30px>",
            ['price'] = 15,
        }, 
    },

    Drinks = {
        [1] = {
            ['drink'] = 'predwine',
            ['drinkname'] = 'Red Wine',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/977949563329597460/rwine.png width=30px>",
            ['glass'] = "pwineglass",
            ['glassname'] = "Wine Glass",
        }, 
        [2] = {
            ['drink'] = 'pwhitewine',
            ['drinkname'] = 'White Wine',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/977948183462289428/rwhitewineglass.png width=30px>",
            ['glass'] = "pwineglass",
            ['glassname'] = "Wine Glass",
        }, 
        [3] = {
            ['drink'] = 'ppinkwine',
            ['drinkname'] = 'Pink Wine',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/977949691209715832/ppinkwine.png width=30px>",
            ['glass'] = "pwineglass",
            ['glassname'] = "Wine Glass",
        }, 
        [4] = {
            ['drink'] = 'pwhiskey',
            ['drinkname'] = 'Whiskey',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/977949497831342180/pwhiskey.png width=30px>",
            ['glass'] = "pwhiskyglass",
            ['glassname'] = "Whiskey Glass",
        }, 
        [5] = {
            ['drink'] = 'pbeermugfull',
            ['drinkname'] = 'Beer',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/977949864992333864/pbeermugfull.png width=30px>",
            ['glass'] = "pbeermug",
            ['glassname'] = "Beer Mug",
        }, 
    },

    GrabDrinks = {
        [1] = {
            ['drink'] = 'pdusche',
            ['drinkname'] = 'Dusche Beer',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/977997686479396944/pdusche.png width=30px>",
        }, 
        [2] = {
            ['drink'] = 'plogger',
            ['drinkname'] = 'Logger Beer',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/977995386541187082/np_logger-beer.png width=30px>",
        }, 
        [3] = {
            ['drink'] = 'pam',
            ['drinkname'] = 'AM Beer',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/977997657953939536/pam.png width=30px>",
        }, 
    },

    GrabBossDrinks = {
        [1] = {
            ['drink'] = 'pgoldsake',
            ['drinkname'] = 'Gold Sake',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978353371079655424/pgoldsake.png width=30px>",
        }, 
        [2] = {
            ['drink'] = 'prum',
            ['drinkname'] = 'Rum',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978353421121900554/prum.png width=30px>",
        }, 
        [3] = {
            ['drink'] = 'pwhitewinebottle',
            ['drinkname'] = 'White Wine',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978353392923603044/pwhitewinebottle.png width=30px>",
        }, 
        [4] = {
            ['drink'] = 'pwhiskeybottle',
            ['drinkname'] = 'Whiskey Bottle',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978353398594281562/pwhiskeybottle.png width=30px>",
        }, 
        [5] = {
            ['drink'] = 'pchampagne',
            ['drinkname'] = 'Champagne Bottle',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978353337370030131/pchampagne.png width=30px>",
        }, 
    },

    Fruits = {
        [1] = {
            ['fruit'] = 'porange',
            ['fruitname'] = 'Orange',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978366440908390430/borange.png width=30px>",
        }, 
        [2] = {
            ['fruit'] = 'papple',
            ['fruitname'] = 'Apple',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978366441214591007/bapple.png width=30px>",
        }, 
        [3] = {
            ['fruit'] = 'pbanana',
            ['fruitname'] = 'Banana',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978366440484786226/bbanana.png width=30px>",
        }, 
    },

    WineRack = {
        [1] = {
            ['wine'] = 'psparklingwine',
            ['winename'] = 'Sparkling Wine',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978765597699633162/psparklingwine.png width=30px>",
        }, 
        [2] = {
            ['wine'] = 'predwinebottle',
            ['winename'] = 'Regular Red Wine',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978765717883220038/np_red-wine-bottle.png width=30px>",
        }, 
        [3] = {
            ['wine'] = 'pcastellobrolio',
            ['winename'] = 'Castello Brolio Red Wine',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978767806915026994/pcastellobrolio.png width=30px>",
        }, 
        [4] = {
            ['wine'] = 'pgaryfarrel',
            ['winename'] = 'Gary Reffel Red Wine',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978767807166689290/pgaryfarrel.png width=30px>",
        }, 
        [5] = {
            ['wine'] = 'prutherfordhill',
            ['winename'] = 'Rutherford Hill Red Wine',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978767807430950912/prutherfordhill.png width=30px>",
        }, 
        [6] = {
            ['wine'] = 'ppinkwinebottle',
            ['winename'] = 'Pink Wine Bottle',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/978772887819407450/ppinkwinebottle.png width=30px>",
        }, 
    },

    CoffeeCups = {
        [1] = {
            ['glass'] = 'phighcoffeeglasscup',
            ['glassname'] = 'High Coffee Glass',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/926465631770005514/963851739767930890/bhighcoffeeglasscup.png width=30px>",
            ['price'] = 50,
        }, 
        [2] = {
            ['glass'] = 'pcoffeeglass',
            ['glassname'] = 'Coffee Glass',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/926465631770005514/963851731794526218/bcoffeeglass.png width=30px>",
            ['price'] = 20,
        }, 
        [3] = {
            ['glass'] = 'pespressocoffeecup',
            ['glassname'] = 'Espresso Coffee Cup',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/926465631770005514/963851746076131378/bexpressocoffeecup.png  width=30px>",
            ['price'] = 15,
        }, 
    },

    DrinksMaker = {
        [1] = {
            ['drink'] = 'psprite',
            ['drinkname'] = 'Sprite',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979129312940797962/bsprite.png width=30px>",
        }, 
        [2] = {
            ['drink'] = 'pcocacola',
            ['drinkname'] = 'CocaCola',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979129313280548936/bcocacola.png width=30px>",
        }, 
        [3] = {
            ['drink'] = 'ppepper',
            ['drinkname'] = 'DR.Pepper',
            ['image'] = "<img src=https://cdn.discordapp.com/attachments/967914093396774942/979129313557352468/bpepper.png  width=30px>",
        }, 
    },
}

Config.Locals = {
    Menus = {
        Garage = {
            MainMenu = {
                MainHeader = "Pizzeria Vehicles",
                Text = "View Vehicles",
                StoreVehicleHeader = "⬅ Store Vehicle",
                CloseMenuHeader = "⬅ Close Menu",
            },
    
            CatalogMenu = {
                MainHeader = "Pizzeria Garage",
                GoBackHeader = "⬅ Go Back",
            },
        },

        Duty = {
            MainHeader = "Duty",
            SecondHeader = "Clock In / Out",
            Text = "Duty Options",
            CloseMenuHeader = "⬅ Close",
        },

        Glasses = {
            MainHeader = "Glasses Menu",
            CloseMenuHeader = "⬅ Close Menu",
        },

        DrinksMachine = {
            MainHeader = "Drinks Menu",
            CloseMenuHeader = "⬅ Close Menu",
        },

        GrabDrinks = {
            MainHeader = "Bottles Menu",
            CloseMenuHeader = "⬅ Close Menu",
        },

        GrabBossDrinks = {
            MainHeader = "Boss Drinks",
            CloseMenuHeader = "⬅ Close Menu",
        },

        Fruits = {
            MainHeader = "Fruits",
            CloseMenuHeader = "⬅ Close Menu",
        },

        WineRack = {
            MainHeader = "Wines",
            CloseMenuHeader = "⬅ Close Menu",
        },

        Dough = {
            MainHeader = "Dough",
            CloseMenuHeader = "⬅ Close Menu",
            SecondHeader = "Grab Dough",
            ThirdHeader = "Add Dough",
            ThirdText = "Add dough to the storage",
            FourthHeader = "No dough available, add dough",
            FourthText = "Add Dough",
        },

        DoughMachine = {
            MainHeader = "Dough Machine",
            CloseMenuHeader = "⬅ Close Menu",
        },

        PrepareDough = {
            MainHeader = "Cut Dough",
            CloseMenuHeader = "⬅ Close Menu",
        },

        CoffeeCups = {
            MainHeader = "Coffee Cups Menu",
            CloseMenuHeader = "⬅ Close Menu",
        },

        DrinksMaker = {
            MainHeader = "Drinks Menu",
            CloseMenuHeader = "⬅ Close Menu",
        },

        MakePizza = {
            MainHeader = "Pizza Menu",
            CloseMenuHeader = "⬅ Close Menu",
        },

        Pastas = {
            MainHeader = "Pasta Menu",
            CloseMenuHeader = "⬅ Close Menu",
        },

        Pizzas = {
            MainHeader = "Pizzas",
            CloseMenuHeader = "⬅ Close Menu",
        },
    },

    Notifications = {
        ItemNotExists = "Item doesnt exists.",
        VehicleStored = 'Vehicle Stored !',
        NotInAnyVehicle = 'You are not in any vehicle !',
        MustBeOnDuty = 'You must be on duty !',
        VehicleBought = 'Vehicle Successfully Bought',
        InventoryFull = "Your inventory is full",
        DontHaveEnoughMoney = 'You don\'t have enough money !',
        ChairIsUsed = "Chair Is Being Used.",
        NoIngredients = "You don't have the right ingredients !",
        DrinkedEnough = "You drank enough !",
        DontHaveDough =  "You don't have enough dough",
        DoughAdded = "Dough Added",
        StorageFull = "Storage is full",
    },

    Progressbars = {
        WashHands = {
            Text = "Washing Hands...",
            Time = 5000,
        },

        Drink = {
            Time = 7000,
        },
    },

    Targets = {
        Chairs = {
            Icon = "fa fa-chair",
            Label = "Sit",
        },

        Duty = {
            Icon = "fa fa-clock",
            Label = "Get On/Off Duty",
        },

        WashHands = {
            Icon = "fa fa-hands-bubbles",
            Label = "Wash Hands",
        },

        Shop = {
            Icon = "fa fa-shop",
            Label = "Open Shop",
        },

        Stash = {
            Icon = "fa fa-box",
            Label = "Open Stash",
        },

        Glasses = { 
            Icon = "fa fa-hand",
            Label = "Take Glasses",
        },

        DrinksMachine = { 
            Icon = "fa fa-beer",
            Label = "Pour Drinks",
        },

        GrabDrinks = { 
            Icon = "fa fa-wine-bottle",
            Label = "Grab Drinks",
        },

        BossStash = { 
            Icon = "fa fa-box",
            Label = "Open Boss Stash",
        },

        GrabBossDrinks = { 
            Icon = "fa fa-wine-bottle",
            Label = "Grab Boss Drinks",
        },

        GrabWater = { 
            Icon = "fa fa-water",
            Label = "Grab Water",
        },

        GrabCoffee = { 
            Icon = "fa fa-coffee",
            Label = "Grab Coffee",
        },

        Fruits = { 
            Icon = "fa fa-lemon",
            Label = "Grab Some Fruits",
        },

        Fridge = { 
            Icon = "fa fa-temperature-empty",
            Label = "Open Fridge",
        },

        Lockers = { 
            Icon = "fa fa-t-shirt",
            Label = "Open Locker",
        },

        Dough = { 
            Icon = "fa fa-bread-slice",
            Label = "Grab Dough",
        },

        WineRacks = { 
            Icon = "fa fa-wine-bottle",
            Label = "Grab Wines",
        },

        PersonalStash = { 
            Icon = "fa fa-box",
            Label = "Open Personal Stash",
        },

        DoughMachine = { 
            Icon = "fa fa-bread-slice",
            Label = "Dough Machine",
        },

        DoughPrepare = { 
            Icon = "fa fa-bread-slice",
            Label = "Cut Dough",
        },

        CoffeeCups = { 
            Icon = "fa fa-beer",
            Label = "Grab Coffee Cup",
        },

        FoodFridge = { 
            Icon = "fa fa-temperature-empty",
            Label = "Open Food Fridge",
        },

        CoffeeMachine = { 
            Icon = "fa fa-coffee",
            Label = "Make Coffee",
        },

        DrinksMaker = { 
            Icon = "fa fa-whiskey-glass",
            Label = "Make Drinks",
        },

        Tray = { 
            Icon = "fas fa-random",
            Label = "Open Tray",
        },

        MakePizza = { 
            Icon = "fa fa-pizza-slice",
            Label = "Prepare Pizza",
        },

        MakePasta = { 
            Icon = "fa fa-angles-left",
            Label = "Make Pasta",
        },

        PizzaOven = { 
            Icon = "fa fa-fire",
            Label = "Cook Pizza",
        },

        PizzaAddons = { 
            Icon = "fa fa-leaf",
            Label = "Pizza Extras",
        },
    },
}

Config.ShopItems = {
    label = "Shop",
    slots = 5,
    items = { 
        [1] = {
            name = "ppizzaflour",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "pwater",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "psalt",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "poil",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "pmenu",
            price = 0,
            amount = 100,
            info = {},
            type = "item",
            slot = 5,
        },
    }
}

Config.FridgeItems = {
    label = "Workers Fridge",
    slots = 5,
    items = {
        [1] = {
            name = "water_bottle",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "kurkakola",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "grapejuice",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "twerks_candy",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "snikkel_candy",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 5,
        },
    }   
}

Config.FoodFridgeItems = {
    label = "Food Fridge",
    slots = 5,
    items = {
        [1] = {
            name = "pmilk",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "pcoffeebeans",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "pcream",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "pcaramelsyrup",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "ptomatosouce",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "pmozzarella",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "pbutter",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "pvegicheese",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "pelbowmacaroni",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "pcheddarcheese",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "pparmesancheese",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "pporkmeat",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "pbbqsouce",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "pregularpasta",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 14,
        },
    }   
}

Config.PizzaExtrasItems = {
    label = "Pizza Extras",
    slots = 5,
    items = {
        [1] = {
            name = "pbasil",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "pmushrooms",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "pseafoodmix",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "ptomatoes",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
    }   
}