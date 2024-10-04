local util = require("util")

local Button = {}
Button.__index = Button

function Button.new(label, x, y, callback, style)
    local defaultStyle = {
        paddingX = 16,
        paddingY = 8,
        color = { 1, 1, 1 },
        background = { .5, .5, .5 },
        backgroundHovered = { .4, .4, .4 },
        backgroundPressed = { .3, .3, .3 },
        centered = true,
        font = love.graphics.getFont()
    }
    style = util.mergeTableLeft(defaultStyle, style or {})
    local text = love.graphics.newText(style.font, label)

    return setmetatable({
        label = label,
        x = x,
        y = y,
        callback = callback,
        style = style,
        text = text,
        isHovered = false,
        isPressed = false,
    }, Button)
end

function Button:mousemoved(x, y)
    self.isHovered = self:containsPoint(x, y)
end

function Button:mousepressed(x, y)
    self.isPressed = self:containsPoint(x, y)
end

function Button:mousereleased(x, y)
    if self:containsPoint(x, y) and self.isPressed then
        self.callback()
    end
    self.isPressed = false
end

function Button:getDimensions()
    local textWidth, textHeight = self.text:getDimensions()
    return textWidth + self.style.paddingX * 2, textHeight + self.style.paddingY * 2
end

function Button:containsPoint(x, y)
    local width, height = self:getDimensions()
    if self.style.centered then
        return x >= self.x - width / 2 and
            y >= self.y - height / 2 and
            x <= self.x + width - width / 2 and
            y <= self.y + height - height / 2
    else
        return x >= self.x and
            y >= self.y and
            x <= self.x + width and
            y <= self.y + height
    end
end

function Button:draw()
    local width, height = self:getDimensions()

    if self.isPressed then
        love.graphics.setColor(self.style.backgroundPressed)
    elseif self.isHovered then
        love.graphics.setColor(self.style.backgroundHovered)
    else
        love.graphics.setColor(self.style.background)
    end

    if self.style.centered then
        love.graphics.rectangle(
            "fill",
            self.x - width / 2,
            self.y - height / 2,
            width,
            height
        )
    else
        love.graphics.rectangle(
            "fill",
            self.x,
            self.y,
            width,
            height
        )
    end

    love.graphics.setColor(self.style.color)
    if self.style.centered then
        love.graphics.draw(
            self.text,
            self.x + self.style.paddingX - width / 2,
            self.y + self.style.paddingY - height / 2
        )
    else
        love.graphics.draw(
            self.text,
            self.x + self.style.paddingX,
            self.y + self.style.paddingY
        )
    end
end

return Button
