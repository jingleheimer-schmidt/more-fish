local sounds = require("__base__.prototypes.entity.sounds")

local base_fish = data.raw["fish"]["fish"]
local base_capsule = data.raw["capsule"]["raw-fish"]

local function create_fish(name, icon, minable_count, probability_expression, autoplace_order)
    local fish = table.deepcopy(base_fish)
    fish.name = name
    fish.icon = icon
    fish.icon_size = 160
    fish.minable.result = "raw-" .. name
    fish.minable.count = minable_count
    fish.order = fish.order .. "[" .. fish.name .. "]"
    if fish.autoplace then
        fish.autoplace.order = autoplace_order
        fish.autoplace.probability_expression = probability_expression
    end
    return fish
end

local function create_capsule(name, icon, damage_amount)
    local capsule = table.deepcopy(base_capsule)
    capsule.name = "raw-" .. name
    capsule.icon = icon
    capsule.icon_size = 160
    capsule.order = capsule.order .. "[" .. name .. "]"
    capsule.rocket_launch_products = {
        { type = "item", name = "raw-fish", amount = 1 }
    }
    capsule.capsule_action = {
        type = "use-on-self",
        attack_parameters = {
            type = "projectile",
            activation_type = "consume",
            ammo_category = "capsule",
            cooldown = 30,
            range = 0,
            ammo_type = {
                category = "capsule",
                target_type = "position",
                action = {
                    type = "direct",
                    action_delivery = {
                        type = "instant",
                        target_effects = {
                            { type = "damage", damage = { type = "physical", amount = damage_amount } },
                            { type = "play-sound", sound = sounds.eat_fish }
                        }
                    }
                }
            }
        }
    }
    return capsule
end

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
        probability_expression = 0.0025
    }
}

local entities = {}

for _, fish in ipairs(fish_data) do
    table.insert(entities, create_fish(fish.name, fish.icon, fish.minable_count, fish.probability_expression, fish.autoplace_order))
    table.insert(entities, create_capsule(fish.name, fish.icon, fish.damage_amount))
end

data:extend(entities)
