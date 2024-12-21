
local sounds = require("__base__.prototypes.entity.sounds")

local base_fish = data.raw["fish"]["fish"]

local salmon = table.deepcopy(base_fish)
salmon.name = "salmon"
salmon.icon = "__more-fish__/graphics/icons/Raw_Salmon_JE2_BE2.png"
salmon.icon_size = 160
salmon.minable.result = "raw-salmon"
salmon.minable.count = 5
salmon.order = "b-a-salmon"
if salmon.autoplace then
    salmon.autoplace.order = "x-salmon"
    salmon.autoplace.probability_expression = 0.5
end

local cod = table.deepcopy(base_fish)
cod.name = "cod"
cod.icon = "__more-fish__/graphics/icons/Raw_Cod_JE4_BE2.png"
cod.icon_size = 160
cod.minable.result = "raw-cod"
cod.minable.count = 5
cod.order = "b-a-cod"
if cod.autoplace then
    cod.autoplace.order = "x-cod"
    cod.autoplace.probability_expression = 0.5
end

local pufferfish = table.deepcopy(base_fish)
pufferfish.name = "pufferfish"
pufferfish.icon = "__more-fish__/graphics/icons/Pufferfish_(item)_JE5_BE2.png"
pufferfish.icon_size = 160
pufferfish.minable.result = "raw-pufferfish"
pufferfish.minable.count = 2
pufferfish.order = "b-a-pufferfish"
if pufferfish.autoplace then
    pufferfish.autoplace.order = "x-pufferfish"
    pufferfish.autoplace.probability_expression = 0.5
end

local clownfish = table.deepcopy(base_fish)
clownfish.name = "clownfish"
clownfish.icon = "__more-fish__/graphics/icons/Tropical_Fish_JE2_BE2.png"
clownfish.icon_size = 160
clownfish.minable.result = "raw-clownfish"
clownfish.minable.count = 1
clownfish.order = "b-a-clownfish"
if clownfish.autoplace then
    clownfish.autoplace.order = "x-clownfish"
    clownfish.autoplace.probability_expression = 0.5
end

local base_capsule = data.raw["capsule"]["raw-fish"]

local salmon_capsule = table.deepcopy(base_capsule)
salmon_capsule.name = "raw-salmon"
salmon_capsule.icon = "__more-fish__/graphics/icons/Raw_Salmon_JE2_BE2.png"
salmon_capsule.icon_size = 160
salmon_capsule.order = "h[raw-fish][salmon]"
salmon_capsule.rocket_launch_products = {
    { type = "item", name = "raw-fish", amount = 1 }
}
salmon_capsule.capsule_action = {
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
                        { type = "damage", damage = { type = "physical", amount = -80 } },
                        { type = "play-sound", sound = sounds.eat_fish }
                    }
                }
            }
        }
    }
}

local cod_capsule = table.deepcopy(base_capsule)
cod_capsule.name = "raw-cod"
cod_capsule.icon = "__more-fish__/graphics/icons/Raw_Cod_JE4_BE2.png"
cod_capsule.icon_size = 160
cod_capsule.order = "h[raw-fish][cod]"
cod_capsule.rocket_launch_products = {
    { type = "item", name = "raw-fish", amount = 1 }
}
cod_capsule.capsule_action = {
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
                        { type = "damage", damage = { type = "physical", amount = -80 } },
                        { type = "play-sound", sound = sounds.eat_fish }
                    }
                }
            }
        }
    }
}

local pufferfish_capsule = table.deepcopy(base_capsule)
pufferfish_capsule.name = "raw-pufferfish"
pufferfish_capsule.icon = "__more-fish__/graphics/icons/Pufferfish_(item)_JE5_BE2.png"
pufferfish_capsule.icon_size = 160
pufferfish_capsule.order = "h[raw-fish][pufferfish]"
pufferfish_capsule.rocket_launch_products = {
    { type = "item", name = "raw-fish", amount = 1 }
}
pufferfish_capsule.capsule_action = {
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
                        { type = "damage", damage = { type = "physical", amount = 80 } },
                        { type = "play-sound", sound = sounds.eat_fish }
                    }
                }
            }
        }
    }
}

local clownfish_capsule = table.deepcopy(base_capsule)
clownfish_capsule.name = "raw-clownfish"
clownfish_capsule.icon = "__more-fish__/graphics/icons/Tropical_Fish_JE2_BE2.png"
clownfish_capsule.icon_size = 160
clownfish_capsule.order = "h[raw-fish][clownfish]"
clownfish_capsule.rocket_launch_products = {
    { type = "item", name = "raw-fish", amount = 1 }
}
clownfish_capsule.capsule_action = {
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
                        { type = "damage", damage = { type = "physical", amount = -100 } },
                        { type = "play-sound", sound = sounds.eat_fish }
                    }
                }
            }
        }
    }
}

data:extend({
    salmon,
    cod,
    clownfish,
    pufferfish,
    salmon_capsule,
    cod_capsule,
    pufferfish_capsule,
    clownfish_capsule
})
