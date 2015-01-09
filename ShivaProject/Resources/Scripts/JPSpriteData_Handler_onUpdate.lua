--------------------------------------------------------------------------------
--  Handler.......... : onUpdate
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function JPSpriteData.onUpdate ( nUpdateCoef )
--------------------------------------------------------------------------------
	
    if ( this.bWalking ( ) )
    then
        local hSprite = this.getSprite ( )
        
        --walk
        local x, y = hud.getComponentPosition ( hSprite )
        x = x + 20 * application.getAverageFrameTime ( ) * this.nDirection ( ) * nUpdateCoef
        hud.setComponentPosition ( hSprite, x, y )
        
        local nLimit = 15
        if ( x <= nLimit and this.nDirection ( ) < 0
            or x >= 100 - nLimit and this.nDirection ( ) > 0 ) --turn
        then
            this.nDirection ( -this.nDirection ( ) )
            
            local bFlipX = this.nDirection ( ) > 0
            JPSprite.setComponentAnimation ( hSprite, "turn", false, bFlipX )
            
            local nDuration = JPSprite.getComponentAnimationDuration ( hSprite )
            this.postEvent ( nDuration, "onWalk" )
            this.bWalking ( false )
        end
	end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
