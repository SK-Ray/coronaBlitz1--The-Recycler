--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d3afe1f9b92cb66cd794e3cf0f22c20d:1/1$
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
            x=1684,
            y=228,
            width=68,
            height=104,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 65,
            sourceHeight = 101
        },
        {
            -- garbage2
            x=1684,
            y=108,
            width=72,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 70,
            sourceHeight = 112
        },
        {
            -- garbage3
            x=1764,
            y=108,
            width=68,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 66,
            sourceHeight = 150
        },
        {
            -- liftArm
            x=1684,
            y=8,
            width=312,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 309,
            sourceHeight = 89
        },
        {
            -- trashCan
            x=1232,
            y=668,
            width=444,
            height=652,

        },
        {
            -- trashCanClipped
            x=1232,
            y=8,
            width=444,
            height=652,

        },
        {
            -- trashCanContainer
            x=8,
            y=1712,
            width=388,
            height=328,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 387,
            sourceHeight = 325
        },
        {
            -- truckContainer
            x=8,
            y=8,
            width=1216,
            height=792,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1215,
            sourceHeight = 790
        },
        {
            -- wheel1
            x=8,
            y=808,
            width=388,
            height=376,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 385,
            sourceHeight = 374
        },
        {
            -- wheel2
            x=8,
            y=1328,
            width=388,
            height=376,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 385,
            sourceHeight = 374
        },
    },
    
    sheetContentWidth = 2048,
    sheetContentHeight = 2048
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
