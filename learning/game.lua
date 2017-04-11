-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local composer = require("composer")
local scene = composer.newScene()

--local group = self.view

local background = display.newImageRect("background.png",360,  570)
background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect("platform.png", 300, 50)
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local balloon = display.newImageRect("balloon.png", 112, 112)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

local text = display.newText("Get Ready", display.contentCenterX, 25, native.systemFont, 36)
text:setFillColor(0,0,0)

local function mainFunc()

  text:removeSelf()

  local physics = require("physics")
  physics.start()

  physics.addBody(platform, "static")
  physics.addBody(balloon, "dynamic", {radius=50, bounce=0.3})

  local function tapBalloon()
    balloon:applyLinearImpulse(0, -0.75, balloon.x, balloon.y)
  end

  local function moveOn()
    composer.gotoScene("gameover")
  end

  local function youLost(self, event)
    balloon:removeEventListener("tap", tapBalloon)
    timer.performWithDelay(2000, moveOn, 1)
  end

  balloon:addEventListener("tap", tapBalloon)
  balloon.collision = youLost
  balloon:addEventListener("collision")
end

timer.performWithDelay(3000, mainFunc, 1)

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
