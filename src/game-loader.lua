local GameLoader = {}

function GameLoader.loadLibraries()
  anim8 = require('src.libs.anim8') -- https://github.com/kikito/anim8
  sti = require('src.libs.sti') -- https://github.com/karai17/Simple-Tiled-Implementation
  hump = {
    camera = require('src.libs.hump.camera'),
  } -- https://github.com/vrld/hump
  wf = require('src.libs.windfield')
end

function GameLoader.loadClasses()
  world = wf.newWorld(0, 0, true)

  require('src.player')
  require('src.enviroment')
  require('src.ui')

  GameMap:load()
end

function GameLoader:loadGame()
  self.loadLibraries()
  self.loadClasses()
end

return GameLoader
