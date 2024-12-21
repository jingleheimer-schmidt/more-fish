
for _, simulation in pairs(data.raw["utility-constants"]["default"].main_menu_simulations) do
    if simulation then
        simulation.mods = simulation.mods or {}
        table.insert(simulation.mods, "more-fish")
    end
end
