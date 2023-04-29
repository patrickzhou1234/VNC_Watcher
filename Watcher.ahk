#persistent

lastFileContent := ""
setTimer, checkFile, 20
return

checkFile:
fileread newFileContent, C:/Program Files/uvnc bvba/UltraVNC/mslogon.log
if(newFileContent != lastFileContent) {
    lastFileContent := newFileContent
    msgbox, detected!
}
return
