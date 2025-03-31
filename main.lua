function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  require('src.startup.startup')
  startup()
end

function love.update(dt)
  local updateGame = require('src.update')
  updateGame(dt)
end

function love.draw()
  local drawGame = require('src.draw')
  Cam:attach()
  drawGame()
  Cam:detach()
end
