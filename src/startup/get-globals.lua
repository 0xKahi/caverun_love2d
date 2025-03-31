function getGlobals()
  anim8 = require('src.libs.anim8') -- https://github.com/kikito/anim8
  sti = require('src.libs.sti') -- https://github.com/karai17/Simple-Tiled-Implementation
  hump = {
    camera = require('src.libs.hump.camera'),
  } -- https://github.com/vrld/hump

  require('src.player')
  require('src.enviroment')
  require('src.ui')
end
