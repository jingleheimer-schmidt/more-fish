
---@class fish_data
---@field name string
---@field icon string
---@field minable_count number
---@field order string
---@field autoplace_order string
---@field damage_amount number
---@field probability_expression number

---@type fish_data[]
local fish_data = {
    {
        name = "salmon",
        icon = "__more-fish__/graphics/icons/Raw_Salmon_JE2_BE2.png",
        minable_count = 5,
        order = "b-a-salmon",
        autoplace_order = "x-salmon",
        damage_amount = -80,
        probability_expression = 0.01
    },
    {
        name = "cod",
        icon = "__more-fish__/graphics/icons/Raw_Cod_JE4_BE2.png",
        minable_count = 5,
        order = "b-a-cod",
        autoplace_order = "x-cod",
        damage_amount = -80,
        probability_expression = 0.01
    },
    {
        name = "pufferfish",
        icon = "__more-fish__/graphics/icons/Pufferfish_(item)_JE5_BE2.png",
        minable_count = 2,
        order = "b-a-pufferfish",
        autoplace_order = "x-pufferfish",
        damage_amount = 80,
        probability_expression = 0.001
    },
    {
        name = "clownfish",
        icon = "__more-fish__/graphics/icons/Tropical_Fish_JE2_BE2.png",
        minable_count = 1,
        order = "b-a-clownfish",
        autoplace_order = "x-clownfish",
        damage_amount = -100,
        probability_expression = 0.005
    }
}

return {
    fish_data = fish_data
}
