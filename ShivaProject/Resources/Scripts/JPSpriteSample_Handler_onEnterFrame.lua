--------------------------------------------------------------------------------
--  Handler.......... : onEnterFrame
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function JPSpriteSample.onEnterFrame (  )
--------------------------------------------------------------------------------
	
    if ( not this.bStarted ( ) )
    then
        return
    end
    
    --Update characters in an optimized way
    -- [[
    local tIndexesToUpdate, nUpdateCoef = JPSprite.helpMeUpdateMySprites ( table.getSize ( this.tSpritesData ( ) ) )
    for i = 0, table.getSize ( tIndexesToUpdate ) - 1
    do
        local nIndex = table.getAt ( tIndexesToUpdate, i )
        
        local hSpriteData = table.getAt ( this.tSpritesData ( ), nIndex )
        object.sendEventImmediate ( hSpriteData, "JPSpriteData", "onUpdate", nUpdateCoef )
    end
    --]]
    
    --Not optimized way
    --[[
    for i = 0, table.getSize ( this.tSpritesData ( ) ) - 1
    do
        local hSpriteData = table.getAt ( this.tSpritesData ( ), i )
        object.sendEventImmediate ( hSpriteData, "JPSpriteData", "onUpdate", 1 )
    end
    --]]
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
