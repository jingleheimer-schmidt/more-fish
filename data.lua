
local base_fish = data.raw["fish"]["fish"]
local base_capsule = data.raw["capsule"]["raw-fish"]

--- Sets up basic data for a prototype.
--- @param prototype data.FishPrototype | data.CapsulePrototype The prototype to set up.
--- @param name string The name of the prototype.
--- @param icon string The path to the icon for the prototype.
local function setup_basic_data(prototype, name, icon)
    prototype.name = name
    prototype.icon = icon
    prototype.icon_size = 160
    prototype.order = prototype.order .. "[" .. name .. "]"
end

--- Creates a new fish prototype based on the base fish.
--- @param name string The name of the new fish.
--- @param icon string The path to the icon for the new fish.
--- @param minable_count number The number of fish that will be returned when mined.
--- @param probability_expression data.NoiseExpression The probability expression for the fish's autoplace.
--- @param autoplace_order string The order for the fish's autoplace.
--- @return data.FishPrototype
local function create_fish(name, icon, minable_count, probability_expression, autoplace_order)
    local fish = table.deepcopy(base_fish) --[[@as data.FishPrototype]]
    setup_basic_data(fish, name, icon)
    fish.minable.result = "raw-" .. name
    fish.minable.count = minable_count
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
    local capsule = table.deepcopy(base_capsule) --[[@as data.CapsulePrototype]]
    setup_basic_data(capsule, name, icon)
    capsule.rocket_launch_products = {
        { type = "item", name = "raw-fish", amount = 1 }
    }
    local target_effects = capsule.capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects
    if target_effects then
        for _, effect in ipairs(target_effects) do
            if effect.type == "damage" then
                effect.damage.amount = damage_amount
            end
        end
    end
    return capsule
end

local fish_data = require("constants").fish_data

for _, fish in ipairs(fish_data) do
    local entity = create_fish(fish.name, fish.icon, fish.minable_count, fish.probability_expression, fish.autoplace_order)
    local item = create_capsule("raw-" .. fish.name, fish.icon, fish.damage_amount)
    data:extend({ entity, item })
end
