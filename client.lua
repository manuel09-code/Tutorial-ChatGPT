addEventHandler("onClientRender", root, function()
    -- Obtiene el vehículo en el que está el jugador
    local vehicle = getPedOccupiedVehicle(localPlayer)
    -- Verifica si el jugador está en un vehículo
    if vehicle then
        -- Obtiene la cantidad de combustible del vehículo
        local fuel = getElementData(vehicle, "fuel")
        -- Obtiene la posición del vehículo
        local x, y, z = getElementPosition(vehicle)
        -- Calcula la posición para dibujar el texto
        local sx, sy = getScreenFromWorldPosition(x, y, z + 1)
        -- Dibuja el texto en pantalla
        dxDrawText("Combustible: " .. fuel .. "%", sx, sy, sx, sy, tocolor(255, 255, 255), 1, "default", "center", "center", false, false, false)
    end
end)

-- Asigna la acción a la tecla "h"
bindKey("h", "down", function()
    -- Obtiene el vehículo en el que está el jugador
    local vehicle = getPedOccupiedVehicle(localPlayer)
    -- Verifica si el jugador está en un vehículo
    if vehicle then
        -- Obtiene el estado del motor del vehículo
        local engine = getVehicleEngineState(vehicle)
        -- Cambia el estado del motor del vehículo
        setVehicleEngineState(vehicle, not engine)
    end
end)
