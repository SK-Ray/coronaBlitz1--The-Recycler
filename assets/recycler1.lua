--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:790df5caaf32851c0bfa8bdfd6889bad:1/1$
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
            x=421,
            y=57,
            width=17,
            height=26,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 16,
            sourceHeight = 25
        },
        {
            -- garbage2
            x=421,
            y=27,
            width=18,
            height=28,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 28
        },
        {
            -- garbage3
            x=441,
            y=27,
            width=17,
            height=38,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 17,
            sourceHeight = 38
        },
        {
            -- liftArm
            x=421,
            y=2,
            width=78,
            height=23,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 77,
            sourceHeight = 22
        },
        {
            -- trashCan
            x=308,
            y=167,
            width=111,
            height=163,

        },
        {
            -- trashCanClipped
            x=308,
            y=2,
            width=111,
            height=163,

        },
        {
            -- trashCanContainer
            x=2,
            y=428,
            width=97,
            height=82,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 97,
            sourceHeight = 81
        },
        {
            -- truckContainer
            x=2,
            y=2,
            width=304,
            height=198,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 304,
            sourceHeight = 198
        },
        {
            -- wheel1
            x=2,
            y=202,
            width=97,
            height=94,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 94
        },
        {
            -- wheel2
            x=2,
            y=332,
            width=97,
            height=94,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 94
        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
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
