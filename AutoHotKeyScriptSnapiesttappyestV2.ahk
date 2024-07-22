; When key is pressed press key and release other key
; When the "a" key is pressed
a::
; Release the "d" key
Send, {a down}
astatus := true
if(dstatus){
    Send, {d up}
    dstatus := false
}
return


; When key is pressed press key and release other key
; When the "d" key is pressed
d::
Send, {d down}
dstatus = true
if(astatus){
    Send, {a up}
    astatus = false
}
return


; When d is released it should release the key
d up::
Send, {d up}
dstatus := false
return
; When a is released it should release the key
a up::
Send, {a up}
astatus := false
return


