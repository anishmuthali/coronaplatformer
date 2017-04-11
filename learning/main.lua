local composer = require("composer")


local scene = composer.newScene()

local widget = require("widget")

local background = display.newImageRect("background.png", 360, 570)

background.x = display.contentCenterX
background.y = display.contentCenterY

local function startGame()
  composer.gotoScene("game")
end

local text = display.newText("Balloon Game", display.contentCenterX, display.contentCenterY, native.systemFont, 36)
text:setFillColor(0,0,0)

local button = widget.newButton{
  labelColor={default = {0,0,0}, over = {0,0,0}},
  onEvent = startGame
}
button.x = display.contentCenterX
button.y = display.contentHeight - 25
button:setLabel("Start Game")
button:setFillColor(0,0,0)

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
