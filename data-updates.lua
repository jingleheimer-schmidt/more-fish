
for _, simulation in pairs(data.raw["utility-constants"]["default"].main_menu_simulations) do
    if simulation then
        simulation.mods = simulation.mods or {}
        table.insert(simulation.mods, "more-fish")
    end
end

local fish_data = require("constants").fish_data

for _, planet in pairs(data.raw["planet"]) do
    if planet.map_gen_settings then
        local autoplace_settings = planet.map_gen_settings.autoplace_settings
        local base_autoplace_settings = autoplace_settings and autoplace_settings["entity"]["settings"]["fish"]
        if base_autoplace_settings then
            for _, fish in pairs(fish_data) do
                planet.map_gen_settings.autoplace_settings["entity"]["settings"][fish.name] = {}
            end
        end
    end
end

if feature_flags["spoiling"] then
    for _, fish in pairs(fish_data) do
        data.raw.capsule["raw-" .. fish.name].spoil_ticks = 453000
        data.raw.capsule["raw-" .. fish.name].spoil_result = "spoilage"
    end
end
