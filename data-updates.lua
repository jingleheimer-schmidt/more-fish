
for _, simulation in pairs(data.raw["utility-constants"]["default"].main_menu_simulations) do
    if simulation then
        simulation.mods = simulation.mods or {}
        table.insert(simulation.mods, "more-fish")
    end
end

local fish_data = {
    {
        name = "salmon",
        icon = "__more-fish__/graphics/icons/Raw_Salmon_JE2_BE2.png",
        minable_count = 5,
        order = "b-a-salmon",
        autoplace_order = "x-salmon",
        damage_amount = -80
    },
    {
        name = "cod",
        icon = "__more-fish__/graphics/icons/Raw_Cod_JE4_BE2.png",
        minable_count = 5,
        order = "b-a-cod",
        autoplace_order = "x-cod",
        damage_amount = -80
    },
    {
        name = "pufferfish",
        icon = "__more-fish__/graphics/icons/Pufferfish_(item)_JE5_BE2.png",
        minable_count = 2,
        order = "b-a-pufferfish",
        autoplace_order = "x-pufferfish",
        damage_amount = 80
    },
    {
        name = "clownfish",
        icon = "__more-fish__/graphics/icons/Tropical_Fish_JE2_BE2.png",
        minable_count = 1,
        order = "b-a-clownfish",
        autoplace_order = "x-clownfish",
        damage_amount = -100
    }
}

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
