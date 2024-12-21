
local function on_init()
    if (game.ticks_played > 1) or game.simulation then
        for _, surface in pairs(game.surfaces) do
            surface.regenerate_entity("salmon")
            surface.regenerate_entity("cod")
            surface.regenerate_entity("pufferfish")
            surface.regenerate_entity("clownfish")
        end
    end
end

script.on_init(on_init)
