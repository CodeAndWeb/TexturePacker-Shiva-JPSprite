--------------------------------------------------------------------------------
--  Function......... : updateInfoLabel
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function JPSpriteSample.updateInfoLabel ( )
--------------------------------------------------------------------------------
	
    local hInfoText = hud.getComponent ( this.getUser ( ), "JPSpriteSample.InfoText" )
	
    local nFramerate = 1 / application.getAverageFrameTime ( )
    local hFramerate = hud.getComponent ( this.getUser ( ), "JPSpriteSample.Framerate" )
    
    local nSpriteCount = table.getSize ( this.tSpritesData ( ) )
    hud.setLabelText ( hInfoText, string.format ( "%i sprites %i fps", nSpriteCount, nFramerate ) )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
