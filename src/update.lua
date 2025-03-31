local function updateGame(dt)
  Player:update(dt)
  Cam:update(dt)
end

return updateGame
