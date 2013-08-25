


--[[

        'The Recycler'
        A tech demo / game made in Corona SDK for the First Corna Blitz 4 hour Game Jam
        Ray Delia
        (c) 2013, S.K. Studios, LLC
        www.stinkykitties.com
        @stinkykitties
        R.Delia on corona forums
        [SK]Ray in IRC
        
--]]
display.setStatusBar( display.HiddenStatusBar )
display.setDefault( "background", 0, 64, 200 )
-- include Corona's "physics" library
 physics = require "physics"
physics.start(); -- physics.pause()
--physics.setDrawMode( "hybrid" ) -- overlays collision outlines on normal Corona objects
--physics.setDrawMode( "debug" ) -- shows collision engine outlines only

--physics.setDrawMode( "normal" ) -- the default Corona renderer, with no collision outlines





local floor = display.newRect(-1000, display.contentHeight - 2 , display.contentWidth + 1000, 20)
physics.addBody(floor,"static")
local floor2 = display.newRect(700, display.contentHeight - 2 , display.contentWidth + 1000, 20)
physics.addBody(floor2,"static")

floor:setFillColor(64, 64, 64, 255)
floor2:setFillColor(64, 64, 64, 255)


local leftwall = display.newRect(0, 0 , 10, display.contentHeight)
physics.addBody(leftwall,"static")
leftwall.alpha = 0


local trashCan = require("trashCan")

trashCan:spawnGarbage({myTime = 400, garbageCount =40, x1 = 20, x2 = display.contentWidth - 20, y1=0, y2= 10})


local trashTruck = require("trashTruck")



