--------------------------------------------------------------------------------
--  Function......... : getSprite
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function JPSpriteData.getSprite ( )
--------------------------------------------------------------------------------
	
    return hud.getComponent ( application.getCurrentUser ( ), "sprite"..this.nIndex ( ) )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
