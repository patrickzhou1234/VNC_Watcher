#persistent

fileread origRead, C:/Program Files/uvnc bvba/UltraVNC/mslogon.log
lastFileContent := origRead
setTimer, checkFile, 20
return

checkFile:
fileread newFileContent, C:/Program Files/uvnc bvba/UltraVNC/mslogon.log
if(newFileContent != lastFileContent) {
    lastFileContent := newFileContent
    WinActivate, ahk_exe Zoom.exe
    Loop, read, C:/Program Files/uvnc bvba/UltraVNC/mslogon.log
        last_line := A_LoopReadLine
    Gui +AlwaysOnTop -Caption +Border
    Gui, Color, 0x05a8ff
    Gui, Font, S20
    last_line_arr := StrSplit(last_line, A_Space)
    If (last_line_arr[5]!="Connection") {
        Gui, Add, Text,, Disconnected!
    } Else {
        Gui, Add, Text,, Connected!
    }
    Gui, Show, x0 y0 NA
    Sleep, 1000
    Gui, Destroy
}
return
