local sounds = require("__base__.prototypes.entity.sounds")

local base_fish = data.raw["fish"]["fish"]
local base_capsule = data.raw["capsule"]["raw-fish"]

--- Creates a new fish prototype based on the base fish.
--- @param name string The name of the new fish.
--- @param icon string The path to the icon for the new fish.
--- @param minable_count number The number of fish that will be returned when mined.
--- @param probability_expression data.NoiseExpression The probability expression for the fish's autoplace.
--- @param autoplace_order string The order for the fish's autoplace.
--- @return data.FishPrototype
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


--- Creates a capsule item with specified properties.
--- @param name string The name of the capsule.
--- @param icon string The icon path for the capsule.
--- @param damage_amount number The amount of damage the capsule will deal when used.
--- @return data.CapsulePrototype
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

local fish_data = require("constants").fish_data

local entities = {}

for _, fish in ipairs(fish_data) do
    table.insert(entities, create_fish(fish.name, fish.icon, fish.minable_count, fish.probability_expression, fish.autoplace_order))
    table.insert(entities, create_capsule(fish.name, fish.icon, fish.damage_amount))
end

data:extend(entities)
