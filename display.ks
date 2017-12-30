CLEARSCREEN.

set display to GUI(200,10).
set display:skin:label:textcolor to GREEN.

//set display:skin:button:bg to "black".
//set display:skin:label:bg to "black".
//set display:skin:flatlayout:bg to "black".Q

display:show().

local isDone is FALSE.
until isDone {
    if (close:TAKEPRESS)
        set isDone to TRUE.
    set str1:text to "MASS:" + VESSEL:MASS.
    wait 0.1.
}

display:hide().
