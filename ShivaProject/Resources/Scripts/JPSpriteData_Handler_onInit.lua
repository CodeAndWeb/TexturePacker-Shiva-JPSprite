--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function JPSpriteData.onInit (  )
--------------------------------------------------------------------------------
	
    local hSprite = hud.newComponent ( application.getCurrentUser ( ), hud.kComponentTypeContainer, "sprite"..this.nIndex ( ) )
    hud.setComponentOrigin ( hSprite, hud.kOriginBottom )
    hud.setComponentIgnoredByMouse ( hSprite, true )
    hud.setComponentContainer ( hSprite, hud.getComponent ( application.getCurrentUser ( ), "JPSpriteSample.Background" ) )
    hud.setComponentBackgroundColor ( hSprite, 127, 127, 127, 255 )
    hud.setComponentBorderColor ( hSprite, 127, 127, 127, 0 )
    
    local nCoefY = math.random ( 0, 1 )
    local x = math.random ( 20, 80 )
    local y = 25 + 10 * ( nCoefY - 0.5 )
    hud.setComponentZOrder ( hSprite, ( 1 - nCoefY ) * 255 ) --ZOrder according to y position
    hud.setComponentPosition ( hSprite, x, y )
	
    this.nDirection ( math.random ( 0, 2 ) < 1 and 1 or -1 ) --random startup direction
    this.sendEvent ( "onWalk" )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
