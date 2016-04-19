#include <WinAPIFiles.au3>
#include <Constants.au3>


Local $PathData = _WinAPI_GetDiskFreeSpaceEx("C:")
Local $PathArchive = _WinAPI_GetDiskFreeSpaceEx("L:")
Local $CCTV_Dir = "L:\"
Local $Archive_Dir = "C:\TEMP\"
Local $CCTV_Min = 20
Local $Archive_Min = 10
Local $CamArr = ["DespArea1", "DespArea2", "FSA-LD", "FSA-RP", "Portal", "RSA"]
Local $ArchMonthList = ["01", "02", "03", "04", "05", "06"]
Local $ArchDayList = ["01", "02", "03", "04", "05", "06", "07", "08"]
;Local $ASearch = FileFindFirstFile($Archive_Dir&"Archive\"&$CamArr[1]&"2016\*.*")
;Local $ASearch = FileFindFirstFile("*.*")
Local  $sFileName = ""

;ConsoleWrite('Total available free space on ' & @HomeDrive & ' => ' & $aData[0] & ' bytes' & @CRLF)
;ConsoleWrite('Total available space on ' & @HomeDrive & ' => ' & $aData[1] & ' bytes' & @CRLF)
;ConsoleWrite('Total free space on ' & @HomeDrive & ' => ' & $aData[2] & ' bytes' & @CRLF)
;FileFindNextFile


FileChangeDir($Archive_Dir&"Archive\"&$CamArr[1]&"\2016\")
Local $ASearch = FileFindFirstFile("*.*")

   $sFileName = FileFindNextFile($ASearch)

   MsgBox($MB_SYSTEMMODAL, "Check free", $Archive_Dir&"Archive\"&$CamArr[1]&"\2016\*.*")
   MsgBox($MB_SYSTEMMODAL, "Check free", $ASearch&"  |  "&$sFileName)
   MsgBox($MB_SYSTEMMODAL, "Check free", $ArchMonthList&"  | "&$Archive_Dir&"Archive\*.*")
If Ceiling($PathData[0]/1000000000) < $CCTV_Min Then

If Ceiling($PathArchive[0]/1000000000) > $Archive_Min Then
      MsgBox($MB_SYSTEMMODAL, "Check free", "Total Size  " & Ceiling($PathData[1]/1000000000) & "  Free C:\ " & Ceiling($PathData[0]/1000000000) & " Gb" & @CRLF & "LDrive Free  " & Ceiling($PathArchive[0]/1000000000) & " Gb" )
Elseif 4>3 Then
      MsgBox($MB_SYSTEMMODAL, "Check free", "ELSEIF  " )
Else
     MsgBox($MB_SYSTEMMODAL, "Check free", "ELSE  " )
EndIf

EndIf
