; Debounce delay
dbounce := 10  ; 50 milliseconds (equivalent to 50000 microseconds)

; When the "a" key is pressed
a::
; Press the "a" key
Send, {a down}
astatus := true
if (dstatus) {
    Send, {d up}
    dstatus := false
    HighResSleep(dbounce)
}
return

; When the "d" key is pressed
d::
; Press the "d" key
Send, {d down}
dstatus := true
if (astatus) {
    Send, {a up}
    astatus := false
    HighResSleep(dbounce)
}
return

; When "d" is released
d up::
Send, {d up}
dstatus := false
return

; When "a" is released
a up::
Send, {a up}
astatus := false
return

; High-resolution timer for a precise delay
HighResSleep(ms) {
    local endTick := A_TickCount + ms
    while (A_TickCount < endTick) {
        DllCall("Sleep", "UInt", 1)  ; Sleep for 1 millisecond intervals
    }
}
