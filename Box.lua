Box = Class{}

function Box:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
end

function Box:update(dt)
  if love.keyboard.isDown('up') then
      player.y = math.max(0, player.y + -PLAYER_SPEED * dt)
  elseif love.keyboard.isDown('down') then
      player.y = math.min(WINDOW_HEIGTH - 12, player.y + PLAYER_SPEED * dt)
  elseif love.keyboard.isDown('left') then
      player.x = math.max(0, player.x + -PLAYER_SPEED * dt)
  elseif love.keyboard.isDown('right') then
      player.x = math.min(WINDOW_WIDTH - 12, player.x + PLAYER_SPEED * dt)
  end
end

function Box:collides (one, two)
    return (
        one.x < two.x + two.width and
        one.x + one.width > two.x and
        one.y < two.y + two.height and
        one.y + one.height > two.y
    )
end
