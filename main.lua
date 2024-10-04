local constants = require("constants")

function love.load()
    love.window.setMode(constants.width, constants.height, { highdpi = true })
    love.window.setTitle("Ludum Dare 56")
end

function love.draw()
    love.graphics.print("hello ld56", 0, 0)
end
