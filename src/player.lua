Player = {}

Player.x = 120
Player.y = 100
Player.speed = 100

Player.spriteSheet = love.graphics.newImage('sprites/slime.png')
Player.grid = anim8.newGrid(32, 32, Player.spriteSheet:getWidth(), Player.spriteSheet:getHeight())

Player.animations = {
  idle = {
    right = anim8.newAnimation(Player.grid('1-4', 1), 0.3),
    left = anim8.newAnimation(Player.grid('1-4', 1), 0.3):flipH(),
  },
  move = {
    right = anim8.newAnimation(Player.grid('1-13', 2), 0.08),
    left = anim8.newAnimation(Player.grid('1-13', 2), 0.08):flipH(),
  },
}

Player.state = {
  direction = 'right',
}
Player.anim = Player.animations.idle

function Player:setAnimation(isMoving)
  if isMoving then
    self.anim = self.animations.move[self.state.direction]
  else
    self.anim = self.animations.idle[self.state.direction]
  end
end

function Player:update(dt)
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

  if love.keyboard.isDown('p') then
    print(self.x, self.y)
  end

  self:setAnimation(isMoving)
  self.anim:update(dt)
end

function Player:draw()
  self.anim:draw(self.spriteSheet, self.x, self.y, nil, nil, nil, 16, 16)
end
