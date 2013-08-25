

local physics = physics
physics.start(); -- physics.pause()


local sheetInfo = require("assets.recycler1")
local sheetInfo2 = require("assets.recycler2")

local myImageSheet = graphics.newImageSheet( "assets/recycler1.png", sheetInfo:getSheet() )
local myImageSheet2 = graphics.newImageSheet( "assets/recycler2.png", sheetInfo2:getSheet() )

local scaleFactor = .25
local physicsData = (require "assets.physicsObjects").physicsData(scaleFactor)

local trashTruck = {}
trashTruck.moving = 0
trashTruck.DO =  display.newSprite( myImageSheet2 ,{frames={sheetInfo:getFrameIndex("trashTruck")}})


trashTruck.DO.x,trashTruck.DO.y = 400,500

trashTruck.wheels = {}
trashTruck.wheels.back =   display.newSprite( myImageSheet ,{frames={sheetInfo:getFrameIndex("wheel1")}})
trashTruck.wheels.front =   display.newSprite( myImageSheet ,{frames={sheetInfo:getFrameIndex("wheel2")}})


trashTruck.wheels.back.x,trashTruck.wheels.back.y = 330,585
trashTruck.wheels.front.x,trashTruck.wheels.front.y = 560,585


--add bodies to each piece
physics.addBody(  trashTruck.DO, physicsData:get("trashTruck") )
physics.addBody( trashTruck.wheels.back , physicsData:get("wheel1") )
physics.addBody( trashTruck.wheels.front, physicsData:get("wheel2") )



--now weld the wheels to the body with wheel joints

local  myJoint1= physics.newJoint( "pivot", trashTruck.wheels.back, trashTruck.DO, trashTruck.wheels.back.x,trashTruck.wheels.back.y, 50,0 )
local myJoint2 = physics.newJoint( "pivot", trashTruck.wheels.front, trashTruck.DO, trashTruck.wheels.front.x,trashTruck.wheels.front.y, 20,10 )

--
--local myCollisionFilter = { categoryBits = 1, maskBits = 6 } 
--trashTruck.mount  = display.newRect(60,405,200,20)
--trashTruck.mount.visible = false
--physics.addBody( trashTruck.mount,{filter=myCollisionFilter})
--local myMountJoint = physics.newJoint( "weld", trashTruck.mount, trashTruck.DO, trashTruck.mount.x,trashTruck.mount.y, 20,10 )
--
--
--
----TODO wire up trash arm
--trashTruck.arm =  display.newSprite( myImageSheet ,{frames={sheetInfo:getFrameIndex("liftArm")}})
--trashTruck.arm.x,trashTruck.arm.y = trashTruck.mount.x ,trashTruck.mount.y + 100
--physics.addBody( trashTruck.arm, physicsData:get("liftArm") )
--
--
----local myJoint3 = physics.newJoint( "distance", trashTruck.arm, trashTruck.DO, trashTruck.arm.x,trashTruck.arm.y, trashTruck.DO.x,trashTruck.DO.y)
--local myJoint3 = physics.newJoint( "pulley", trashTruck.arm, trashTruck.mount, trashTruck.mount.x,trashTruck.mount.y, trashTruck.arm.x,trashTruck.arm.y,trashTruck.mount.x,trashTruck.mount.y,trashTruck.arm.x,trashTruck.arm.y,1)
--



--add sensor to know if you got the trash in

--myTarget1.isSensor = true
trashTruck.sensor = display.newRect(400,300,420,20)
physics.addBody(trashTruck.sensor, "static")
trashTruck.sensor.isSensor = true
trashTruck.sensor.myType = "Sensor"


--weld seemed to make the truck stop responding to linear impulses....
--myJoint = physics.newJoint( "weld", trashTruck.sensor, trashTruck.DO, trashTruck.sensor.x,trashTruck.sensor.y, 20,10 )








local myEnterFrame = function(event)
    --print("truck enterframe")
    trashTruck.DO:toFront()
    trashTruck.wheels.back:toFront()
    trashTruck.wheels.front:toFront()
   -- trashTruck.arm:toFront()
    
    
    
    
    trashTruck.sensor.x,trashTruck.sensor.y = trashTruck.DO.x,trashTruck.DO.y
    
    trashTruck.sensor.rotation = trashTruck.DO.rotation
    
    
    
    --move the truck itself
    trashTruck.wheels.front:applyLinearImpulse(trashTruck.moving * .3 ,0 , 0, 0)
    trashTruck.wheels.back:applyLinearImpulse(trashTruck.moving * .2 ,0 , 0, 0)
   -- trashTruck.arm:applyLinearImpulse(trashTruck.liftArmButton.moving * .2,trashTruck.liftArmButton.moving * 1.2,0,0)
    

   -- trashTruck.arm.y = trashTruck.DO.y+100
    
end
Runtime:addEventListener("enterFrame", myEnterFrame)


trashTruck.liftArmButton = display.newRect(775,66,50,50)

trashTruck.liftArmButton.moving = 0 
trashTruck.liftArmButton.touch = function(event)
    print("lift arm")
    if event.phase =="began" then
        trashTruck.liftArmButton.moving = 1 
    end
    if event.phase =="ended" then
        trashTruck.liftArmButton.moving = 0 
        
    end
    
end
trashTruck.liftArmButton:addEventListener("touch", trashTruck.liftArmButton.touch)




trashTruck.moveRight = display.newRect(850,20,50,50)
trashTruck.moveLeft = display.newRect(700,20,50,50)

trashTruck.moveRight.touch = function(event)
    print("right")
    if event.phase =="began" then
        trashTruck.moving = 1 
    end
    if event.phase =="ended" then
        trashTruck.moving = 0 
        
    end
    
end
trashTruck.moveRight:addEventListener("touch", trashTruck.moveRight.touch)

trashTruck.moveLeft.touch = function(event)
    print("left")
    if event.phase =="began" then
        trashTruck.moving = -1 
        
    end
    if event.phase =="ended" then
        trashTruck.moving = 0 
        
    end
end
trashTruck.moveLeft:addEventListener("touch", trashTruck.moveLeft.touch)




return trashTruck
