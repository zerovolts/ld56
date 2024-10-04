local global = {}

function global.loadScene(scene)
    global.currentScene = scene
    scene:load()
end

return global
