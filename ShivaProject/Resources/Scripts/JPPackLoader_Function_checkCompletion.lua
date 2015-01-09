--------------------------------------------------------------------------------
--  Function......... : checkCompletion
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function JPPackLoader.checkCompletion ( )
--------------------------------------------------------------------------------
	
    if ( hashtable.isEmpty ( this.htPacksLoading ( ) ) and this.bEndLoadingPacks ( ) and not this.bCompletionMessageSent ( ) )
    then
        this.bCompletionMessageSent ( true )
        
        local hUser = application.getCurrentUser ( )
        local sHandler = "onPacksLoadingDidEnd"
        for i = 0, user.getAIModelCount ( hUser ) - 1
        do
            local sAIModel = user.getAIModelNameAt ( hUser, i )
            if ( string.contains ( sAIModel, "/" ) )
            then
                local nIndex = string.findFirst ( sAIModel, "/", 0 )
                sAIModel = string.getSubString ( sAIModel, nIndex + 1, string.getLength ( sAIModel ) - ( nIndex + 1 ) )
            end
            if ( user.hasAIEventHandler ( hUser, sAIModel, sHandler ) )
            then
                user.sendEventImmediate ( hUser, sAIModel, sHandler )
            end
        end
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
