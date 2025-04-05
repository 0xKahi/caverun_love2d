GameMap = {}

GameMap.levels = {
  [1] = sti.__call(nil, 'maps/dungeon-1.lua', { 'box2d' }),
}

GameMap.currentLevel = 1

function GameMap:load()
  self.currentMap = self.levels[self.currentLevel]

  -- load wall colliders
  if self.currentMap.layers['walls-collider'] then
    for i, obj in pairs(self.currentMap.layers['walls-collider'].objects) do
      ---@type wf.Collider
      local collider = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
      collider:setType('static')
    end
  end
end

function GameMap:draw()
  self.currentMap:drawLayer(self.currentMap.layers['background'])
  self.currentMap:drawLayer(self.currentMap.layers['walls'])
end
