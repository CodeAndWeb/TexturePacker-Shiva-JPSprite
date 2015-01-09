--------------------------------------------------------------------------------
--  Handler.......... : onLoadLocalPacks
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function JPPackLoader.onLoadLocalPacks (  )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    
    local sPath = this.getPath ( )
    
    local tFiles = table.newInstance ( )
    
    system.findFiles ( tFiles, sPath, "JP*.stk" )
    
    local tPacks = {}
    
    for i = 0, table.getSize ( tFiles ) - 1
    do
        local sFile = table.getAt ( tFiles, i )
        if ( string.findFirstMatching ( sFile, "^JP[A-Z][^_]-_%d+_%d+%.stk$", 0 ) >= 0 )
        then
            sFile = string.replace ( sFile, ".stk", "" )
            
            local nIndex, nLength = string.findFirstMatching ( sFile, "^.-_", 0 )
            if ( nIndex >= 0 )
            then
                local sPack = string.getSubString ( sFile, 0, nLength - 1 )
                local sVersion = string.getSubString ( sFile, nLength, string.getLength ( sFile ) - nLength )
                local tTmp = table.newInstance ( )
                string.explode ( string.replace ( sVersion, "_", "." ), tTmp, "." )
                local nMajor = string.toNumber ( table.getFirst ( tTmp ) )
                local nMinor = string.toNumber ( table.getLast ( tTmp ) )
                
                if ( not tPacks[sPack]
                        or nMajor > tPacks[sPack]["major"] or nMajor == tPacks[sPack]["major"] and nMinor > tPacks[sPack]["minor"] )
                then
                    tPacks[sPack]={}
                    tPacks[sPack]["version"]=sVersion
                    tPacks[sPack]["major"]=nMinor
                    tPacks[sPack]["minor"]=nMajor
                end
            end
        end
    end
    
    for sPack in tPacks
    do
        local sVersion = tPacks[sPack]["version"]
        user.sendEventImmediate ( hUser, "JPPackLoader", "onLoadPack", sPack, sPath .. "/" ..sPack .. "_" ..sVersion .. ".stk" )
    end
    
    user.sendEventImmediate ( hUser, "JPPackLoader", "onLoadPacksEnd" )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
