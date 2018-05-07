-----------------------------------------------------------------------------------------
--
-- intro_screen.lua
-- Created by: Ms Raffin
-- Date: Nov. 22nd, 2014
-- Description: This is the splash screen of the game. It displays the app letterF and the 
-- company letterF with some sort of animation...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-- Create Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local letterF
local earth
local sword
local logoText

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function RotateEarth( event )
    earth:rotate(1)

end

local function RiseLetterF( event )
    if (letterF.y <= 650) then
        letterF.y = 650
    else
        letterF.y = letterF.y - 15
    end
end


local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    --Hide the status bar
    display.setStatusBar(display.HiddenStatusBar)

    -- set the background color
    display.setDefault("background", 0.3, 0.3, 0.3)


    -- letterF image
    letterF = display.newImageRect("Images/F.png", 400, 400)

    -- set the x and y position of the letterF
    letterF.x = display.contentWidth*1/3
    letterF.y = display.contentHeight*2
   

    earth = display.newImageRect("Images/earth.png", 300, 300)
    --position
    earth.x = display.contentWidth*3/4
    earth.y = display.contentHeight/6

    sword = display.newImageRect("Images/sword.png", 200, 200)
    sword.x = display.contentWidth
    sword.y = display.contentHeight*3/4

    logoText = display.newImageRect("Images/text.png", 700, 70)
    logoText.x = display.contentCenterX
    logoText.y = display.contentHeight*9/10

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( letterF )
    sceneGroup:insert( earth )
    sceneGroup:insert( sword )
    sceneGroup:insert( logoText )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

    Runtime:addEventListener("enterFrame", RotateEarth)
    Runtime:addEventListener("enterFrame", RiseLetterF)
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase 

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then

        
    elseif ( phase == "did") then

        
    end

    -----------------------------------------------------------------------------------------
end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene