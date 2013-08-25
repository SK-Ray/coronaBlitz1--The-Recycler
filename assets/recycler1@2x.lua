--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:ac5d8591648c833817d3b22c50adfafd:1/1$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- garbage1
            x=842,
            y=114,
            width=34,
            height=52,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 33,
            sourceHeight = 51
        },
        {
            -- garbage2
            x=842,
            y=54,
            width=36,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 35,
            sourceHeight = 56
        },
        {
            -- garbage3
            x=882,
            y=54,
            width=34,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 33,
            sourceHeight = 75
        },
        {
            -- liftArm
            x=842,
            y=4,
            width=156,
            height=46,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 155,
            sourceHeight = 45
        },
        {
            -- trashCan
            x=616,
            y=334,
            width=222,
            height=326,

        },
        {
            -- trashCanClipped
            x=616,
            y=4,
            width=222,
            height=326,

        },
        {
            -- trashCanContainer
            x=4,
            y=856,
            width=194,
            height=164,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 194,
            sourceHeight = 163
        },
        {
            -- truckContainer
            x=4,
            y=4,
            width=608,
            height=396,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 608,
            sourceHeight = 395
        },
        {
            -- wheel1
            x=4,
            y=404,
            width=194,
            height=188,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 193,
            sourceHeight = 187
        },
        {
            -- wheel2
            x=4,
            y=664,
            width=194,
            height=188,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 193,
            sourceHeight = 187
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["garbage1"] = 1,
    ["garbage2"] = 2,
    ["garbage3"] = 3,
    ["liftArm"] = 4,
    ["trashCan"] = 5,
    ["trashCanClipped"] = 6,
    ["trashCanContainer"] = 7,
    ["truckContainer"] = 8,
    ["wheel1"] = 9,
    ["wheel2"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
