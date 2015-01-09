--------------------------------------------------------------------------------
--  Handler.......... : onStart
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function JPSpriteSample.onStart (  )
--------------------------------------------------------------------------------
	
    this.bStarted ( true )
    
    application.setOption ( application.kOptionViewportRotation, 0 )
    if ( application.getCurrentUserViewportHeight ( ) > application.getCurrentUserViewportWidth ( ) )
    then
        application.setOption ( application.kOptionViewportRotation, 1 )
    end
    
    hud.newTemplateInstance ( this.getUser ( ), "JPSpriteSample", "JPSpriteSample" )
    local nAtlasScale = application.getCurrentUserViewportHeight ( ) / 1000
    JPSprite.setupAtlas ( "jpspritesample_sprites", nAtlasScale )
    JPSprite.setOptimizationSystemEnabled ( true )
    
    local hLessComponent = hud.getComponent ( this.getUser ( ), "JPSpriteSample.Less" )
    local hMoreComponent = hud.getComponent ( this.getUser ( ), "JPSpriteSample.More" )
    JPSprite.setComponentSprite ( hLessComponent, "less" )
    JPSprite.setComponentSprite ( hMoreComponent, "more" )
    
    this.nStep ( 1 )
    this.updateStepLabel ( )
    
    application.setCurrentUserScene ( "JPSpriteSample" )
    local hScene = application.getCurrentUserScene ( )
    this.hRootObject ( scene.createRuntimeObject ( hScene, "" ) )
    object.setVisible ( this.hRootObject ( ), false )
    object.forceInactive ( this.hRootObject ( ), true, true )
    
    this.sendEvent ( "onUpdateFramerate" )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
