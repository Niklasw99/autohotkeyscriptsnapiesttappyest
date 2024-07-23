; Initialize variables
astatus := false
aupstatus := true
dstatus := false
dupstatus := true

; Debounce delay
dbounce := 10  ; 10 milliseconds

; High-resolution timer for a precise delay
HighResSleep(ms) {
    local endTick := A_TickCount + ms
    while (A_TickCount < endTick) {
        DllCall("Sleep", "UInt", 1)  ; Sleep for 1 millisecond intervals
    }
}

; When "d" is released
~d up::
if (!dupstatus){
    dupstatus := true
    dstatus := false
    HighResSleep(dbounce)
    Send, {d up}
}
return

; When "a" is released
~a up::
if (!aupstatus){
    aupstatus := true
    astatus := false
    HighResSleep(dbounce)
    Send, {a up}
}
return

; When the "a" key is pressed 
a::
if (!astatus){
    if (dstatus){
        Send, {d up}
        dupstatus := true
        dstatus := false
        HighResSleep(dbounce)
    }
    Send, {a down}
    astatus := true
    aupstatus := false
}
return

; When the "d" key is pressed 
d::
if (!dstatus){
    if (astatus){
        Send, {a up}
        aupstatus := true
        astatus := false
        HighResSleep(dbounce)
    }
    Send, {d down}
    dstatus := true
    dupstatus := false
}
return
