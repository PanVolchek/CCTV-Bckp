#include <WinAPIFiles.au3>
#include <Constants.au3>


Local $cData = _WinAPI_GetDiskFreeSpaceEx("C:")
Local $lData = _WinAPI_GetDiskFreeSpaceEx("L:")
Local $CCTV_Dir = "C:\TEMP"
Local $Archive_Dir = "L:\BACKUP"


;ConsoleWrite('Total available free space on ' & @HomeDrive & ' => ' & $aData[0] & ' bytes' & @CRLF)
;ConsoleWrite('Total available space on ' & @HomeDrive & ' => ' & $aData[1] & ' bytes' & @CRLF)
;ConsoleWrite('Total free space on ' & @HomeDrive & ' => ' & $aData[2] & ' bytes' & @CRLF)

If Ceiling($cData[0]/1000000000) < 10 Then

If Ceiling($lData[0]/1000000000) > 10 Then
      MsgBox($MB_SYSTEMMODAL, "Check free", "Total Size  " & Ceiling($cData[1]/1000000000) & "  Free C:\ " & $cData[0]/1000000000 & " Gb" & @CRLF & "LDrive Free  " & Ceiling($lData[0]/1000000000) & " Gb" )
Elseif 4>3 Then
      MsgBox($MB_SYSTEMMODAL, "Check free", "ELSEIF  " )
Else
     MsgBox($MB_SYSTEMMODAL, "Check free", "ELSE  " )
EndIf

EndIf
