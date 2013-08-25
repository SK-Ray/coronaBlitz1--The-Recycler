application = {
	content = {
		width =  640,
		height =  960, 
		scale = "zoomStretch",
		fps = 60,
		
		--[
        imageSuffix = {
		    ["@2x"] = 2,
		    ["@4x"] = 4,

		}
		--]]
	},

    --[[
    -- Push notifications

    notification =
    {
        iphone =
        {
            types =
            {
                "badge", "sound", "alert", "newsstand"
            }
        }
    }
    --]]    
}
