

--[[
        
        --trash can
        
--]]



local physics = physics
physics.start(); -- physics.pause()


local trashCan = {}
trashCan.score = 0


local sheetInfo = require("assets.recycler1")
local myImageSheet = graphics.newImageSheet( "assets/recycler1.png", sheetInfo:getSheet() )
local scaleFactor = .25
local physicsData = (require "assets.physicsObjects").physicsData(scaleFactor)

trashCan.sequenceData1 =
{
    name="trashcan",
    frames= { 5}, -- frame indexes of animation, in image sheet
    -- time =  1000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
    loopCount = 0        -- Optional. Default is 0.
}

trashCan.sequenceData2 =
{
    name="trashcan",
    frames= { 6}, -- frame indexes of animation, in image sheet
    -- time =  1000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
    loopCount = 0        -- Optional. Default is 0.
}

trashCan.DOBack = display.newSprite( myImageSheet ,trashCan.sequenceData1 )

--trashCan.DOBack:setReferencePoint(display.BottomLeftReferencePoint)

trashCan.DOFront = display.newSprite( myImageSheet ,trashCan.sequenceData2 )
--trashCan.DOFront:setReferencePoint(display.BottomLeftReferencePoint)
trashCan.DOBack.y = 570
trashCan.DOBack.x = 765



physics.addBody( trashCan.DOBack, physicsData:get("trashCan") )


local function spawnGarbage(params)
    
    
    local garbageCount = params.garbageCount
    local myGarbage = {}
    local myRandom =  math.random(1,3)
    myGarbage.DO =  display.newSprite( myImageSheet ,{frames={sheetInfo:getFrameIndex("garbage"..myRandom)}})
    myGarbage.DO.x, myGarbage.DO.y =  math.random(params.x1,params.x2), math.random(params.y1,params.y2)
    physics.addBody(  myGarbage.DO, physicsData:get("garbage"..myRandom) )
    myGarbage.DO.rotation = math.random(1,259)
    myGarbage.DO.angular = math.random(1,100) 
    myGarbage.DO.myGarbage = myGarbage
    myGarbage.DO.myType = "garbage"
    
    
    return myGarbage
end
trashCan.scoreObject = display.newText("Score: 000", 20   , 20, 0, 0, system.defaultFont, 22)

function trashCan.scoreFunction()
    trashCan.score = trashCan.score + 100
    trashCan.scoreObject.text = "Score: "..trashCan.score
    print("Score: ",trashCan.score)
    
end

function trashCan:spawnGarbage(params)
    
    local myGarbageFiller = timer.performWithDelay(params.myTime,function() spawnGarbage(params) end,   params.garbageCount)
end

local myEnterFrame = function(event)
    --   print("trashcan enterframe")
    trashCan.DOFront.x,trashCan.DOFront.y = trashCan.DOBack.x,trashCan.DOBack.y
    trashCan.DOFront.rotation = trashCan.DOBack.rotation
    
    trashCan.DOFront:toFront()
end
Runtime:addEventListener("enterFrame", myEnterFrame)

local function onCollision(event)
    --object1, object2,
    if event.phase == "began" then
        
        
        local isTrue = false
        if (event.object1.myType == "Sensor") and (event.object2.myType=="garbage")then
            trashCan.scoreFunction()
                        event.object2:removeSelf()

            event.object2.y = 1000
            isTrue = true
            return
            
        end
        if (event.object2.myType == "Sensor")and (event.object2.myType=="garbage") then
            trashCan.scoreFunction()
            event.object1:removeSelf()
            isTrue = true
            return
            
        end
        if isTrue == true then
            print(event.object1.myType,event.object2.myType)
        end
    end
end

Runtime:addEventListener("collision",onCollision)

return trashCan
