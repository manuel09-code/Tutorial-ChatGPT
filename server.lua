function spawnVehicle ( player )
    local x, y, z = getElementPosition ( player )
    local rx, ry, rz = getElementRotation ( player )
    local vehicle = createVehicle ( 411, x + 5, y + 5, z + 2, rx, ry, rz )
    setElementDimension ( vehicle, getElementDimension ( player ) )
    setElementInterior ( vehicle, getElementInterior ( player ) )
    setElementData ( vehicle, "owner", player )
    setElementData ( vehicle, "fuel", 100 )
    setElementData ( vehicle, "engine", false )
    setElementData ( vehicle, "locked", true )
    outputChatBox ( "Vehículo creado correctamente.", player, 0, 255, 0 )
end
addCommandHandler ( "carro", spawnVehicle )

-- Crea un temporizador que se ejecuta cada 60 segundos
setTimer(function()
    -- Obtiene todos los vehículos en el juego
    local vehicles = getElementsByType("vehicle")
    -- Itera sobre cada vehículo
    for _, vehicle in ipairs(vehicles) do
        -- Verifica si el vehículo está encendido
        if getVehicleEngineState(vehicle) then
            -- Obtiene la cantidad actual de combustible del vehículo
            local fuel = getElementData(vehicle, "fuel")
            -- Verifica si el vehículo aún tiene combustible
            if fuel > 0 then
                -- Reduce la cantidad de combustible en el vehículo en 1%
                setElementData(vehicle, "fuel", fuel - 1)
            else
                -- Apaga el motor del vehículo
                setVehicleEngineState(vehicle, false)
                -- Notifica al propietario que el vehículo se quedó sin combustible
                local owner = getElementData(vehicle, "owner")
                outputChatBox("Tu vehículo se quedó sin combustible, necesitas llenarlo para poder encenderlo de nuevo.", owner, 255, 0, 0)
            end
        end
    end
end, 3000, 0)


-- Evento que se ejecuta cuando el jugador entra a un vehículo
addEventHandler("onPlayerVehicleEnter", root, function(vehicle)
    -- Enciende el motor del vehículo
    setVehicleEngineState(vehicle, true)
end)

-- Evento que se ejecuta cuando el jugador sale de un vehículo
addEventHandler("onPlayerVehicleExit", root, function(vehicle)
    -- Apaga el motor del vehículo
    setVehicleEngineState(vehicle, false)
end)
