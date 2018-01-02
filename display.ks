CLEARSCREEN.

set display to GUI(250,10).
set display:skin:label:textcolor to GREEN.
set display:skin:label:fontsize to 11.

set dtitle to display:addlabel("Stats display").
set box1 to display:ADDVLAYOUT().

//box1:addspacing(50).
set vessel to ship.
set sMass to box1:addlabel("Mass: " + ROUND(VESSEL:MASS, 2) + "t").
set aSpeed to box1:addlabel("AirSpeed: " + ROUND(VESSEL:AIRSPEED, 2) + "m/s").
set apopis to box1:addlabel("Apoapsis: " + ROUND(ALT:APOAPSIS, 2) + " m | ETA: " + ROUND(ETA:APOAPSIS, 2) + "s").

set prival to ROUND(ALT:PERIAPSIS, 2).
if(prival < 0)
	set prival to "CAUTION, no periapsis found...".
else
	set prival to prival + "m".

set priaps to box1:addlabel("Periapsis: " + prival + "| ETA: " + ROUND(ETA:PERIAPSIS, 2) + "s").
set rad to box1:addlabel("Radar altitude: " + ROUND(ALT:RADAR, 2) + "m").


//box1:addlabel("Engines:").
//set prts to vessel:parts.
//set engLabels to list().

//list engines in prts.
//set engs to 0.

//for eng in prts {
//	set l to box1:addlabel("Eng " + engs + " " + eng:isp).
//	engLabels:add(l).
//	set engs to engs + 1.
//}.

//set engs to 0.
//	for eng in prts {
//		set engLabels[engs]:text to "Eng " + engs + " " + eng:isp.
//		set engs to engs + 1.
//}.


//set angMomemtum to box1:addLabel("Angular Momentum: " + VESSEL:ANGULARMOMENTUM).

local close is display:ADDBUTTON("close").

display:show().

local isDone is FALSE.
until isDone {
    if (close:TAKEPRESS)
        set isDone to TRUE.
    set sMass:text to "Mass: " + ROUND(VESSEL:MASS, 2) + "t".
	set aSpeed:text to "AirSpeed: " + ROUND(VESSEL:AIRSPEED, 2) + "m/s".
	set apopis:text to "Apoapsis: " + ROUND(ALT:APOAPSIS, 2) + "m | ETA: " + ROUND(ETA:APOAPSIS, 2) + "s".

	set prival to ROUND(ALT:PERIAPSIS, 2).
	if(prival < 0)
		set prival to "CAUTION, no periapsis found...".
	else
		set prival to prival + "m".

	set priaps:text to "Periapsis: " + prival + "| ETA: " + ROUND(ETA:PERIAPSIS, 2) + "s".
	set rad:text to "Radar altitude: " + ROUND(ALT:RADAR, 2) + "m".

	
	//set angMomemtum:text to "Angular Momentum: " + VESSEL:ANGULARMOMENTUM.

    wait 0.1.
}

display:hide().
