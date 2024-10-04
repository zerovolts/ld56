function love.load()
    love.window.setMode(1280, 720, { highdpi = true })
    love.window.setTitle("Ludum Dare 56")
end

function love.draw()
    love.graphics.print("hello ld56", 0, 0)
end
