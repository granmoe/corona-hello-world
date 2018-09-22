local composer = require( "composer" )
local scene = composer.newScene()

local musicTrack

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImageRect( sceneGroup, "src/images/background.png", 800, 1400 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	local title = display.newImageRect( sceneGroup, "src/images/title.png", 500, 80 )
	title.x = display.contentCenterX
	title.y = 200

	local playButton = display.newText( sceneGroup, "Play", display.contentCenterX, 700, native.systemFont, 44 )
	playButton:setFillColor( 0.82, 0.86, 1 )

	local highScoresButton = display.newText( sceneGroup, "High Scores", display.contentCenterX, 810, native.systemFont, 44 )
	highScoresButton:setFillColor( 0.75, 0.78, 1 )

	playButton:addEventListener( "tap", function ()
		composer.gotoScene('src.scenes.game', { time=800, effect="crossFade" } )
	end)

	highScoresButton:addEventListener( "tap", function ()
		composer.gotoScene('src.scenes.highscores', { time=800, effect="crossFade" } )
	end)

	musicTrack = audio.loadStream( "src/audio/Escape_Looping.wav" )
end

function scene:show( event )
	if ( event.phase == "did" ) then
		audio.play( musicTrack, { channel=1, loops=-1 } )
	end
end

function scene:hide( event )
	if ( event.phase == "did" ) then
		audio.stop( 1 )
	end
end

function scene:destroy( event )
	audio.dispose( musicTrack )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
