-- Box Eat Dot
-- Goal of game is to get a box that is bigger than the dots to freely move on
-- the screen and eat all dots it sees. Once all dots are gone you win. Thats it

-- Here is where you require things and set some global variables

Class = require 'class'
require 'Box'
require 'Dot'

PLAYER_SPEED = 200
WINDOW_WIDTH = 1280
WINDOW_HEIGTH = 720

math.randomseed(os.time())

function love.load()

-- One time game loading stuff at the beginning of game

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGTH, {resizable=true, vsync=true, minwidth=400, minheight=300})
    love.window.setTitle('Box Eat Dot')

    player = Box(WINDOW_WIDTH / 2 - 4, WINDOW_HEIGTH / 2 - 4, 12, 12)
    dot1 = Dot(math.random(0, 1260), math.random(0, 700), 4, 4)
    dot2 = Dot(math.random(0, 1260), math.random(0, 700), 4, 4)
    dot3 = Dot(math.random(0, 1260), math.random(0, 700), 4, 4)
    dot4 = Dot(math.random(0, 1260), math.random(0, 700), 4, 4)

    sounds = {
        ['paddle_hit'] = love.audio.newSource('paddle_hit.wav', 'static'),
    }

end

function love.update(dt)

-- Stuff that needs updated every frame - delta time things

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' then
        -- function LÖVE gives us to terminate application
        love.event.quit()
    end
end

player:update(dt)

if Box:collides(player, dot1) then
    dot1 = Dot(math.random(0, 1260), math.random(0, 700), 4, 4)
    sounds['paddle_hit']:play()
end

if Box:collides(player, dot2) then
    dot2 = Dot(math.random(0, 1260), math.random(0, 700), 4, 4)
    sounds['paddle_hit']:play()
end

if Box:collides(player, dot3) then
    dot3 = Dot(math.random(0, 1260), math.random(0, 700), 4, 4)
    sounds['paddle_hit']:play()
end

if Box:collides(player, dot4) then
    dot4 = Dot(math.random(0, 1260), math.random(0, 700), 4, 4)
    sounds['paddle_hit']:play()
end

end

function love.draw()

-- How to draw all the things

    love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)
    love.graphics.rectangle('fill', dot1.x, dot1.y, dot1.width, dot1.height)
    love.graphics.rectangle('fill', dot2.x, dot2.y, dot3.width, dot2.height)
    love.graphics.rectangle('fill', dot3.x, dot3.y, dot3.width, dot3.height)
    love.graphics.rectangle('fill', dot4.x, dot4.y, dot4.width, dot4.height)

end
