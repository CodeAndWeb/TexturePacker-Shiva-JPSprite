--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function JPSpriteSample.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local hUnderCursorComponent = hud.getUnderCursorComponent ( this.getUser ( ) )
    if ( not hUnderCursorComponent or hud.getComponentTag ( hUnderCursorComponent ) ~= "JPSpriteSample.Background" )
    then
        return
    end
    
    local hScene = application.getCurrentUserScene ( )
    
    for i = 0, this.nStep ( ) - 1
    do
        local nIndex = table.getSize ( this.tSpritesData ( ) )
        
        local hSpriteData = scene.createRuntimeObject ( hScene, "" )
        object.setParent ( hSpriteData, this.hRootObject ( ), true )
        object.addAIModel ( hSpriteData, "JPSpriteData" )
        object.setAIVariable ( hSpriteData, "JPSpriteData", "nIndex", nIndex )
        
        table.add ( this.tSpritesData ( ), hSpriteData )
    end
    
    this.updateInfoLabel ( )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
