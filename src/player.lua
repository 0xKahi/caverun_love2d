Player = {}

-- Player.vx = 0
-- Player.vy = 0

Player.speed = 5000

Player.state = {
  direction = 'right',
  wasMoving = false,
}

Player.collider = {
  width = 22,
  height = 24,
  offsetY = -5,
  offsetX = 1,
}

---@type wf.Collider
Player.physics = world:newRectangleCollider(120, 100, Player.collider.width, Player.collider.height)
-- Player.physics:setCollisionClass('Player')
Player.physics:setFixedRotation(true)

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

Player.anim = Player.animations.idle

function Player:setAnimation(isMoving)
  if isMoving then
    self.anim = self.animations.move[self.state.direction]

    -- if player was not moving before restart animation
    if not self.state.wasMoving then
      self.anim:gotoFrame(1)
    end
  else
    self.anim = self.animations.idle[self.state.direction]
  end
end

function Player:update(dt)
  local isMoving = false
  local velocity = {
    x = 0,
    y = 0,
  }

  if love.keyboard.isDown('left') or love.keyboard.isDown('a') then
    velocity.x = -1 * self.speed * dt
    isMoving = true
    self.state.direction = 'left'
  end

  if love.keyboard.isDown('right') or love.keyboard.isDown('d') then
    velocity.x = self.speed * dt
    isMoving = true
    self.state.direction = 'right'
  end

  if love.keyboard.isDown('up') or love.keyboard.isDown('w') then
    velocity.y = -1 * self.speed * dt
    isMoving = true
  end

  if love.keyboard.isDown('down') or love.keyboard.isDown('s') then
    velocity.y = self.speed * dt
    isMoving = true
  end

  if love.keyboard.isDown('p') then
    local px, py = self.physics:getPosition()
    print(px, py)
  end

  self.physics:setLinearVelocity(velocity.x, velocity.y)

  world:update(dt)

  self:setAnimation(isMoving)
  self.state.wasMoving = isMoving
  self.anim:update(dt)
end

function Player:draw()
  local px, py = self.physics:getPosition()

  -- offset player sprite to be in the middle of the collider
  if self.state.direction == 'left' then
    px = px - self.collider.offsetX
  end

  if self.state.direction == 'right' then
    px = px + self.collider.offsetX
  end

  self.anim:draw(self.spriteSheet, px, py + self.collider.offsetY, nil, nil, nil, 16, 16)
end
