player = {}

player.x = 400
player.y = 200
player.speed = 500

player.spriteSheet = love.graphics.newImage('sprites/crusty-crawler.png')
player.grid = anim8.newGrid(32, 32, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

player.animations = {
  idle = {
    right = anim8.newAnimation(player.grid('1-5', 1), 0.2),
    left = anim8.newAnimation(player.grid('1-5', 1), 0.2):flipH(),
  },
  move = {
    right = anim8.newAnimation(player.grid('1-6', 2), 0.1),
    left = anim8.newAnimation(player.grid('1-6', 2), 0.1):flipH(),
  },
}

player.state = {
  direction = 'right',
}
player.anim = player.animations.idle

function player:setAnimation(isMoving)
  if isMoving then
    self.anim = self.animations.move[self.state.direction]
  else
    self.anim = self.animations.idle[self.state.direction]
  end
end

function player:update(dt)
  local isMoving = false
  if love.keyboard.isDown('left') or love.keyboard.isDown('a') then
    self.x = self.x - self.speed * dt
    isMoving = true
    self.state.direction = 'left'
  end

  if love.keyboard.isDown('right') or love.keyboard.isDown('d') then
    self.x = self.x + self.speed * dt
    isMoving = true
    self.state.direction = 'right'
  end

  if love.keyboard.isDown('up') or love.keyboard.isDown('w') then
    self.y = self.y - self.speed * dt
    isMoving = true
  end

  if love.keyboard.isDown('down') or love.keyboard.isDown('s') then
    self.y = self.y + self.speed * dt
    isMoving = true
  end

  self:setAnimation(isMoving)
  self.anim:update(dt)
end

function player:draw()
  self.anim:draw(self.spriteSheet, self.x, self.y, nil, 2, 2)
end
