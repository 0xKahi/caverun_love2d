function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  local GameLoader = require('src.game-loader')
  GameLoader:loadGame()
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
