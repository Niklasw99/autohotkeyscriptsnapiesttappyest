; When key is pressed press key and release other key
; When the "a" key is pressed
a::
; Release the "d" key
Send, {a down}
Send, {d up}
return


; When key is pressed press key and release other key
; When the "d" key is pressed
d::
Send, {d down}
Send, {a up}
return


; When d is released it should release the key
d up::
Send, {d up}
return
; When a is released it should release the key
a up::
Send, {a up}
return
