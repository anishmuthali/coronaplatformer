local composer = require("composer")

local scene = composer.newScene()

local widget = require("widget")

local background = display.newImageRect("background.png", 360, 570)

background.x = display.contentCenterX
background.y = display.contentCenterY

local text = display.newText("Game Over", display.contentCenterX, display.contentCenterY, native.systemFont, 36)
text:setFillColor(0,0,0)

local function restartGame()
  composer.gotoScene("main")
end

local button = widget.newButton{
  labelColor={default = {0,0,0}, over = {0,0,0}},
  onEvent = restartGame
}



button.x = display.contentCenterX
button.y = display.contentHeight - 25
button:setLabel("Retry")
button:setFillColor(0,0,0)


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
