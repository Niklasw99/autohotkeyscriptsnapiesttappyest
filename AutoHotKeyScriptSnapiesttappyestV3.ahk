; Debounce delay
dbounce := 10  ; 50 milliseconds (equivalent to 50000 microseconds)

; When the "d" key is pressed 
a::
; Press the "a" key
Send, {a down}
astatus := true
aupstatus := false
if (dstatus) {
    if (!dupstatus){
    Send, {d up}
    dupstatus := true
    HighResSleep(dbounce)
}
}
return

; When the "d" key is pressed 
d::
; Press the "d" key
Send, {d down}
dstatus := true
dupstatus := false
if (astatus) {
    if (!aupstatus){
    Send, {a up}
    aupstatus := true
    HighResSleep(dbounce)
}

}
return

; When "d" is released
d up::
if (!dupstatus){
    Send, {d up}
    dupstatus := true
}
return

; When "a" is released
a up::
if (!aupstatus){
    Send, {a up}
    dupstatus := true
}
return

; High-resolution timer for a precise delay
HighResSleep(ms) {
    local endTick := A_TickCount + ms
    while (A_TickCount < endTick) {
        DllCall("Sleep", "UInt", 1)  ; Sleep for 1 millisecond intervals
    }
}
