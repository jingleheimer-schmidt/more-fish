
local func_capture = require("__simhelper__.funccapture")

local function simulation_init()
    for _, surface in pairs(game.surfaces) do
        surface.regenerate_entity("salmon")
        surface.regenerate_entity("cod")
        surface.regenerate_entity("pufferfish")
        surface.regenerate_entity("clownfish")
    end
end

for _, simulation in pairs(data.raw["utility-constants"]["default"].main_menu_simulations) do
    if simulation then
        if simulation.init then
            local existing_init = assert(load(simulation.init))
            simulation.init = func_capture.capture(function()
                existing_init()
                simulation_init()
            end)
        else
            simulation.init = func_capture.capture(function()
                simulation_init()
            end)
        end
    end
end
