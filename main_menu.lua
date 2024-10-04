local global = require("global")
local constants = require("constants")
local Button = require("button")
local Game = require("game")

local MainMenu = {}

function MainMenu:load()
    self.ui = {}

    table.insert(self.ui, Button.new(
        "Play",
        constants.width / 2,
        constants.height / 2,
        function() global.loadScene(Game) end,
        { font = love.graphics.newFont(20) }
    ))
end

function MainMenu:mousemoved(x, y)
    for i, node in ipairs(self.ui) do
        node:mousemoved(x, y)
    end
end

function MainMenu:mousepressed(x, y)
    for i, node in ipairs(self.ui) do
        node:mousepressed(x, y)
    end
end

function MainMenu:mousereleased(x, y)
    for i, node in ipairs(self.ui) do
        node:mousereleased(x, y)
    end
end

function MainMenu:draw()
    for i, node in ipairs(self.ui) do
        node:draw()
    end
end

return MainMenu
