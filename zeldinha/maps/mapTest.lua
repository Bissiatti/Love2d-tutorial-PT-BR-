rpgMap = {}
local sti = require("libs.sti")

function rpgMap:load()
    rpgMap.map = sti("maps/assets/map0.lua")
end

function rpgMap:update(dt)
    rpgMap.map:update(dt)
end

function rpgMap:draw()
    rpgMap.map:drawLayer(rpgMap.map.layers['floor'])
end

function rpgMap:Tree()
    rpgMap.map:drawLayer(rpgMap.map.layers['tree'])
end
