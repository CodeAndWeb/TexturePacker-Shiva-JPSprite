--------------------------------------------------------------------------------
--  Function......... : increaseStep
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function JPSpriteSample.increaseStep ( )
--------------------------------------------------------------------------------
	
    this.nStep ( math.min ( this.nStep ( ) + 1, 100 ) )
    this.updateStepLabel ( )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
