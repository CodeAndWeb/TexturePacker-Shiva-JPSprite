--------------------------------------------------------------------------------
--  Handler.......... : onLoadPack
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function JPPackLoader.onLoadPack ( sPackName, sPackURI )
--------------------------------------------------------------------------------
	
    local sFilename = sPackName .. "_pack"
    local sSTK = sFilename .. ".stk"
    
    if ( cache.getFileStatus ( sSTK ) == -1 )
    then
        cache.addFile ( sSTK, sPackURI )
        hashtable.add ( this.htPacksLoading ( ), sPackName, nil )
    end
    
    local nStatus = cache.getFileStatus ( sSTK )
    if ( nStatus == 1 )
    then
        local sLoaderAIModel = sPackName .. "Loader"
        user.addAIModel ( application.getCurrentUser ( ), sFilename .."/" .. sLoaderAIModel )
        user.sendEventImmediate ( application.getCurrentUser ( ), sLoaderAIModel, "onLoad" )
        
        table.add ( this.tLoadedPacks ( ), sPackName )
        
        hashtable.remove ( this.htPacksLoading ( ), sPackName )
        this.checkCompletion ( )
    elseif ( nStatus < 0 )
    then
        log.warning ( "Pack not found : ", sPackName )
        hashtable.remove ( this.htPacksLoading ( ), sPackName )
        this.checkCompletion ( )
    else
        this.postEvent ( 0, "onLoadPack", sPackName, sPackURI )
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
