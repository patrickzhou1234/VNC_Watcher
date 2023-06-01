#persistent

fileread origRead, C:/Program Files/uvnc bvba/UltraVNC/mslogon.log
lastFileContent := origRead
setTimer, checkFile, 20
return

checkFile:
fileread newFileContent, C:/Program Files/uvnc bvba/UltraVNC/mslogon.log
if(newFileContent != lastFileContent) {
    lastFileContent := newFileContent
    WinActivate, ahk_exe chrome.exe
    msgbox, detected!
}
return
