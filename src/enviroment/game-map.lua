GameMap = {}

GameMap.levels = {
  [1] = sti.__call(_, 'maps/dungeon-1.lua', { 'box2d' }),
}

GameMap.currentLevel = 1

function GameMap:load()
  self.currentMap = self.levels[self.currentLevel]
end

function GameMap:draw()
  self.currentMap:drawLayer(self.currentMap.layers['background'])
  self.currentMap:drawLayer(self.currentMap.layers['walls'])
end
