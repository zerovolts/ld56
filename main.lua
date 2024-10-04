local global = require("global")
local constants = require("constants")
local MainMenu = require("main_menu")

function love.load()
    love.window.setMode(constants.width, constants.height, { highdpi = true })
    love.window.setTitle("Ludum Dare 56")

    global.loadScene(MainMenu)
end

function love.mousemoved(x, y)
    if global.currentScene.mousemoved then
        global.currentScene:mousemoved(x, y)
    end
end

function love.mousepressed(x, y)
    if global.currentScene.mousepressed then
        global.currentScene:mousepressed(x, y)
    end
end

function love.mousereleased(x, y)
    if global.currentScene.mousereleased then
        global.currentScene:mousereleased(x, y)
    end
end

function love.draw()
    if global.currentScene.draw then
        global.currentScene:draw()
    end
end
