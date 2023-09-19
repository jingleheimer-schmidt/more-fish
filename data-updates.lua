
local func_capture = require("__simhelper__.funccapture")

local function on_init()
    for _, surface in pairs(game.surfaces) do
        surface.regenerate_entity("salmon")
        surface.regenerate_entity("cod")
        surface.regenerate_entity("pufferfish")
        surface.regenerate_entity("clownfish")
    end
end

local init_script = func_capture.capture(on_init)

for _, simulation in pairs(data.raw["utility-constants"]["default"].main_menu_simulations) do
    if simulation then
        if simulation.init then
            simulation.init = simulation.init .. init_script
        else
            simulation.init = init_script
        end
    end
end
