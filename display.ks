CLEARSCREEN.

set display to GUI(250,10).
set display:skin:label:textcolor to GREEN.

//set display:skin:button:bg to "black".
//set display:skin:label:bg to "black".
//set display:skin:flatlayout:bg to "black".

set dtitle to display:addlabel("Stats display").
set box1 to display:ADDVLAYOUT().

//box1:addspacing(50).
set vessel to ship.
set sMass to box1:addlabel("MASS: " + VESSEL:MASS).
set aSpeed to box1:addlabel("AirSpeed: " + VESSEL:AIRSPEED).
set angMomemtum to box1:addLabel("Angular Momentum: " + VESSEL:ANGULARMOMENTUM).

local close is display:ADDBUTTON("close").

display:show().

local isDone is FALSE.
until isDone {
    if (close:TAKEPRESS)
        set isDone to TRUE.
    set sMass:text to "MASS: " + VESSEL:MASS.
	set aSpeed:text to "AirSpeed: " + VESSEL:AIRSPEED.
	set angMomemtum:text to "Angular Momentum: " + VESSEL:ANGULARMOMENTUM.

//    wait 0.1.
}

display:hide().
