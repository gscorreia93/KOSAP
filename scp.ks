clearscreen.

function countdown {
	set x to 10.
	print "Counting ...".
	until x < 0 {
		print x.
		set x to x - 1.
		wait 1.
		clearscreen.
	}.
}

function estBurn {
	parameter eng.
	parameter neng.
	
	set res to stage:resources.
	
	set tp to "LiquidFuel".
	if(eng:throttlelock)
		set tp to "SolidFuel".

	for re in res{
		if(re:name = tp){
			set r to re.
		}
	}
	until eng:flameout {
		clearscreen.
		print "Estimated burn time:".
		if(eng:fuelflow > 0)
			print round(r:amount/(eng:fuelflow*neng), 2) + "s".
		else
			print "0s".	
		
		wait 0.1.
	}
}

when alt:radar > 10000 then {

	SAS off.
	set tgt to vessel:facing:yaw - 90.
	set ship:control:yaw to +1.

	print "Performing pitch to " + tgt + " from " + vessel:facing:yaw.

	until abs(vessel:facing:yaw - tgt) < 1 {
		wait 0.1.
	}.

	set  vessel:control:yaw to 0.

	SAS on.

}.

countdown().

set vessel to ship.
RCS on.
SAS on.
set vessel:control:mainthrottle to 1.

print "Lift-off".
stage.

set prts to vessel:parts.
list engines in prts.

estBurn(prts[5], 4).

clearscreen.

print "Jettisoning solid boosters.".
stage.
print "Starting liquid fuel engine...".
wait 1.
stage.

set prts to vessel:parts.
list engines in prts.

estBurn(prts[1], 1).

set vessel:control:neutralize to true.


