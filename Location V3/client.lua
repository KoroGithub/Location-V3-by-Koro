RMenu.Add("Koro", "script_main", RageUI.CreateMenu("Koro Location v3","La V3 les gars !"))
RMenu:Get("Koro", 'script_main').Closed = function()end



RMenu.Add("Koro", "script_main2", RageUI.CreateSubMenu(RMenu:Get("Koro", "script_main"), "Voitures / Motos", "Voici les Voitures / Motos"))
RMenu:Get("Koro", "script_main2").Closed = function()end


    Citizen.CreateThread(function()
        while true do 
            local interval = 1
            local pos = GetEntityCoords(PlayerPedId())
            local dest = vector3(-2036.3853, -545.1092, 8.9256)
            local distance = GetDistanceBetweenCoords(pos, dest, true)

            if distance > 20 then 
                interval = 200
            else
                interval = 1
                DrawMarker(31, -2036.3853, -545.1092, 8.9256, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 0, 255, 170, 0, 1, 2, 0, nil, nil, 0)
                if distance < 1 then
                    AddTextEntry("HELP", "Appuyer sur ~INPUT_CONTEXT~ ~s~ pour acceder au menu")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlPressed(1, 51) then
                        RageUI.Visible(RMenu:Get("Koro","script_main"), true)

                    end
                end
            end

            Citizen.Wait(interval)
        end
    end)

Citizen.CreateThread(function()
    local cooldown = false
    while true do 

        RageUI.IsVisible(RMenu:Get("Koro","script_main"),true,true,true,function()

            RageUI.ButtonWithStyle("~b~Voitures / Motos", nil, {RightLabel = ">>"}, not cooldown,function(h,a,s)
                end, RMenu:Get("Koro","script_main2"))        


        end, function()end, 1)


        RageUI.IsVisible(RMenu:Get("Koro","script_main2"),true,true,true,function()

        RageUI.ButtonWithStyle("Blista", "Prend toi une blista bg !", {RightBadge = RageUI.BadgeStyle.Car}, true,function(h,a,s)
        if s then 
            RageUI.CloseAll()
            local model = GetHashKey("blista")
            RequestModel(model)
            while not HasModelLoaded(model) do Citizen.Wait(10) end
            local pos = GetEntityCoords(PlayerPedId())
            local vehicle = CreateVehicle(model, pos.x, pos.y, pos.z, 90, true, false)
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        end
    end)

            RageUI.ButtonWithStyle("Blista 2", "Prend toi le nouveau model de la Blista !", {RightBadge = RageUI.BadgeStyle.Car}, true,function(h,a,s)
                if s then 
                    RageUI.CloseAll()
                    local model = GetHashKey("blista2")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, pos.x, pos.y, pos.z, 90, true, false)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                end
            end)

            RageUI.ButtonWithStyle("🔽", "On passe au moto", {}, true,function(h,a,s)
                if s then 
                    RageUI.CloseAll()
                end
            end)

            RageUI.ButtonWithStyle("Faggio", "Prend toi un faggio !", {RightBadge = RageUI.BadgeStyle.Bike}, true,function(h,a,s)
                if s then 
                    RageUI.CloseAll()
                    local model = GetHashKey("faggio")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, pos.x, pos.y, pos.z, 90, true, false)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                end
            end)


            RageUI.ButtonWithStyle("Faggio 2", "Prend toi le nouveau model de lu faggio !", {RightBadge = RageUI.BadgeStyle.Bike}, true,function(h,a,s)
                if s then 
                    RageUI.CloseAll()
                    local model = GetHashKey("faggio2")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, pos.x, pos.y, pos.z, 90, true, false)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                end
            end)

        end, function()end, 1)

            Citizen.Wait(0)
        end
    end)