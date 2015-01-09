--------------------------------------------------------------------------------
--  Function......... : getFileURI
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function JPPackLoader.getFileURI ( sFile )
--------------------------------------------------------------------------------
	
    local sPath = this.getPath ( )
	
    local sLastChar = string.getSubString ( sPath, string.getLength ( sPath ) - 1, 1 )
    if ( sLastChar ~= "/" and sLastChar ~= "\\" )
    then
        sPath = sPath .. "/"
    end
    
    return sPath .. sFile
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------