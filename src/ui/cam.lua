local scale = 2
local offset = 0 -- offset so some of the outside map is visible

Cam = hump.camera.new(Player.physics:getX(), Player.physics:getY(), scale)

function Cam:update(dt)
  local w = (love.graphics.getWidth() / scale) - offset
  local h = (love.graphics.getHeight() / scale) - offset

  local mapW = (GameMap.currentMap.width * GameMap.currentMap.tilewidth) - offset
  local mapH = (GameMap.currentMap.height * GameMap.currentMap.tileheight) - offset

  self:lookAt(Player.physics:getX(), Player.physics:getY())

  -- left border
  if self.x < w / 2 then
    self.x = w / 2
  end

  -- top border
  if self.y < h / 2 then
    self.y = h / 2
  end

  -- right border
  if self.x > (mapW - w / 2) then
    self.x = (mapW - w / 2)
  end

  -- bottom border
  if self.y > (mapH - h / 2) then
    self.y = (mapH - h / 2)
  end
end
