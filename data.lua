
local sounds = require("__base__.prototypes.entity.sounds")

local salmon = {
    type = "fish",
    name = "salmon",
    icon = "__more-fish__/graphics/icons/Raw_Salmon_JE2_BE2.png",
    icon_size = 160,
    flags = { "placeable-neutral", "not-on-map" },
    minable = { mining_time = 0.4, result = "raw-salmon", count = 5 },
    mined_sound = sounds.mine_fish,
    max_health = 20,
    subgroup = "creatures",
    order = "b-a-salmon",
    collision_box = { { -0.75, -0.75 }, { 0.75, 0.75 } },
    selection_box = { { -0.5, -0.3 }, { 0.5, 0.3 } },
    pictures =
    {
        {
            filename = "__base__/graphics/entity/fish/fish-1.png",
            priority = "extra-high",
            width = 22,
            height = 36
        },
        {
            filename = "__base__/graphics/entity/fish/fish-2.png",
            priority = "extra-high",
            width = 32,
            height = 32
        }
    },
    autoplace =
    {
        order = "x-salmon",
        peaks =
        {
            {
                influence = 0.01,
                min_influence = 0,
                water_optimal = 0.624,
                water_range = 0.124,
                water_max_range = 0.124,
            }
        }
    }
}

local cod = {
    type = "fish",
    name = "cod",
    icon = "__more-fish__/graphics/icons/Raw_Cod_JE4_BE2.png",
    icon_size = 160,
    flags = { "placeable-neutral", "not-on-map" },
    minable = { mining_time = 0.4, result = "raw-cod", count = 5 },
    mined_sound = sounds.mine_fish,
    max_health = 20,
    subgroup = "creatures",
    order = "b-a-cod",
    collision_box = { { -0.75, -0.75 }, { 0.75, 0.75 } },
    selection_box = { { -0.5, -0.3 }, { 0.5, 0.3 } },
    pictures =
    {
        {
            filename = "__base__/graphics/entity/fish/fish-1.png",
            priority = "extra-high",
            width = 22,
            height = 36
        },
        {
            filename = "__base__/graphics/entity/fish/fish-2.png",
            priority = "extra-high",
            width = 32,
            height = 32
        }
    },
    autoplace =
    {
        order = "x-cod",
        peaks =
        {
            {
                influence = 0.01,
                min_influence = 0,
                water_optimal = 0.876,
                water_range = 0.126,
                water_max_range = 0.126,
            }
        }
    }
}

local pufferfish = {
    type = "fish",
    name = "pufferfish",
    icon = "__more-fish__/graphics/icons/Pufferfish_(item)_JE5_BE2.png",
    icon_size = 160,
    flags = { "placeable-neutral", "not-on-map" },
    minable = { mining_time = 0.4, result = "raw-pufferfish", count = 2 },
    mined_sound = sounds.mine_fish,
    max_health = 20,
    subgroup = "creatures",
    order = "b-a-pufferfish",
    collision_box = { { -0.75, -0.75 }, { 0.75, 0.75 } },
    selection_box = { { -0.5, -0.3 }, { 0.5, 0.3 } },
    pictures =
    {
        {
            filename = "__base__/graphics/entity/fish/fish-1.png",
            priority = "extra-high",
            width = 22,
            height = 36
        },
        {
            filename = "__base__/graphics/entity/fish/fish-2.png",
            priority = "extra-high",
            width = 32,
            height = 32
        }
    },
    autoplace =
    {
        order = "x-pufferfish",
        peaks =
        {
            {
                influence = 0.01,
                min_influence = 0,
                water_optimal = 0.252,
                water_range = 0.252,
                water_max_range = 0.252,
            }
        }
    }
}

local clownfish = {
    type = "fish",
    name = "clownfish",
    icon = "__more-fish__/graphics/icons/Tropical_Fish_JE2_BE2.png",
    icon_size = 160,
    flags = { "placeable-neutral", "not-on-map" },
    minable = { mining_time = 0.4, result = "raw-clownfish", count = 1 },
    mined_sound = sounds.mine_fish,
    max_health = 20,
    subgroup = "creatures",
    order = "b-a-clownfish",
    collision_box = { { -0.75, -0.75 }, { 0.75, 0.75 } },
    selection_box = { { -0.5, -0.3 }, { 0.5, 0.3 } },
    pictures =
    {
        {
            filename = "__base__/graphics/entity/fish/fish-1.png",
            priority = "extra-high",
            width = 22,
            height = 36
        },
        {
            filename = "__base__/graphics/entity/fish/fish-2.png",
            priority = "extra-high",
            width = 32,
            height = 32
        }
    },
    autoplace =
    {
        order = "x-clownfish",
        peaks =
        {
            {
                influence = 0.01,
                min_influence = 0,
                water_optimal = 0.261,
                water_range = 0.261,
                water_max_range = 0.261,
            }
        }
    }
}

local salmonItem = {
    type = "capsule",
    name = "raw-salmon",
    icon = "__more-fish__/graphics/icons/Raw_Salmon_JE2_BE2.png",
    icon_size = 160,
    subgroup = "raw-resource",
    capsule_action =
    {
        type = "use-on-self",
        attack_parameters =
        {
            type = "projectile",
            activation_type = "consume",
            ammo_category = "capsule",
            cooldown = 30,
            range = 0,
            ammo_type =
            {
                category = "capsule",
                target_type = "position",
                action =
                {
                    type = "direct",
                    action_delivery =
                    {
                        type = "instant",
                        target_effects =
                        {
                            {
                                type = "damage",
                                damage = { type = "physical", amount = -80 }
                            },
                            {
                                type = "play-sound",
                                sound = sounds.eat_fish
                            }
                        }
                    }
                }
            }
        }
    },
    order = "h[raw-fish][salmon]",
    rocket_launch_product = { "raw-fish", 1 },
    stack_size = 100
}

local codItem = {
    type = "capsule",
    name = "raw-cod",
    icon = "__more-fish__/graphics/icons/Raw_Cod_JE4_BE2.png",
    icon_size = 160,
    subgroup = "raw-resource",
    capsule_action =
    {
        type = "use-on-self",
        attack_parameters =
        {
            type = "projectile",
            activation_type = "consume",
            ammo_category = "capsule",
            cooldown = 30,
            range = 0,
            ammo_type =
            {
                category = "capsule",
                target_type = "position",
                action =
                {
                    type = "direct",
                    action_delivery =
                    {
                        type = "instant",
                        target_effects =
                        {
                            {
                                type = "damage",
                                damage = { type = "physical", amount = -80 }
                            },
                            {
                                type = "play-sound",
                                sound = sounds.eat_fish
                            }
                        }
                    }
                }
            }
        }
    },
    order = "h[raw-fish][cod]",
    rocket_launch_product = { "raw-fish", 1 },
    stack_size = 100
}

local pufferfishItem = {
    type = "capsule",
    name = "raw-pufferfish",
    icon = "__more-fish__/graphics/icons/Pufferfish_(item)_JE5_BE2.png",
    icon_size = 160,
    subgroup = "raw-resource",
    capsule_action =
    {
        type = "use-on-self",
        attack_parameters =
        {
            type = "projectile",
            activation_type = "consume",
            ammo_category = "capsule",
            cooldown = 30,
            range = 0,
            ammo_type =
            {
                category = "capsule",
                target_type = "position",
                action =
                {
                    type = "direct",
                    action_delivery =
                    {
                        type = "instant",
                        target_effects =
                        {
                            {
                                type = "damage",
                                damage = { type = "physical", amount = 80 }
                            },
                            {
                                type = "play-sound",
                                sound = sounds.eat_fish
                            }
                        }
                    }
                }
            }
        }
    },
    order = "h[raw-fish][pufferfish]",
    rocket_launch_product = { "raw-fish", 1 },
    stack_size = 100
}

local clownfishItem = {
    type = "capsule",
    name = "raw-clownfish",
    icon = "__more-fish__/graphics/icons/Tropical_Fish_JE2_BE2.png",
    icon_size = 160,
    subgroup = "raw-resource",
    capsule_action =
    {
        type = "use-on-self",
        attack_parameters =
        {
            type = "projectile",
            activation_type = "consume",
            ammo_category = "capsule",
            cooldown = 30,
            range = 0,
            ammo_type =
            {
                category = "capsule",
                target_type = "position",
                action =
                {
                    type = "direct",
                    action_delivery =
                    {
                        type = "instant",
                        target_effects =
                        {
                            {
                                type = "damage",
                                damage = { type = "physical", amount = -100 }
                            },
                            {
                                type = "play-sound",
                                sound = sounds.eat_fish
                            }
                        }
                    }
                }
            }
        }
    },
    order = "h[raw-fish][clownfish]",
    rocket_launch_product = { "raw-fish", 1 },
    stack_size = 100
}

data:extend({
    salmon,
    cod,
    clownfish,
    pufferfish,
    salmonItem,
    codItem,
    pufferfishItem,
    clownfishItem
})
