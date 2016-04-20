#include <WinAPIFiles.au3>
#include <Constants.au3>
#include <Array.au3>


Local $PathData = _WinAPI_GetDiskFreeSpaceEx("C:")
Local $PathArchive = _WinAPI_GetDiskFreeSpaceEx("L:")
Local $CCTV_Dir = "L:\"
Local $Archive_Dir = "C:\TEMP\"
Local $CCTV_Min = 200
Local $Archive_Min = 10
Local $CamArr = ["DespArea1", "DespArea2", "FSA-LD", "FSA-RP", "Portal", "RSA"]
Local $ArchMonthList [12] = ["99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99"]
Local $ArchDayList [31] = []
;Local $ASearch = FileFindFirstFile($Archive_Dir&"Archive\"&$CamArr[1]&"2016\*.*")
;Local $ASearch = FileFindFirstFile("*.*")
Local  $sFileName = ""
Local $MinFromMonth
Local $i=0
Local $MonthCounter=0
Local $DayCounter=0

;ConsoleWrite('Total available free space on ' & @HomeDrive & ' => ' & $aData[0] & ' bytes' & @CRLF)
;ConsoleWrite('Total available space on ' & @HomeDrive & ' => ' & $aData[1] & ' bytes' & @CRLF)
;ConsoleWrite('Total free space on ' & @HomeDrive & ' => ' & $aData[2] & ' bytes' & @CRLF)
;FileFindNextFile
 ;  $sFileName = FileFindNextFile($ASearch)

;FileChangeDir($Archive_Dir&"Archive\"&$CamArr[1]&"\2016\")
;Local $ASearch = FileFindFirstFile("*.*")


;ConsoleWrite("before Cycle  "&$ASearch&" $sFileName  "&$sFileName&@CRLF)



While $i<6
   FileChangeDir($Archive_Dir&"Archive\"&$CamArr[$i]&"\2016\")
   $MonthCounter = 0
   Local $ASearch = FileFindFirstFile("*.*")

    $sFileName = FileFindNextFile($ASearch)
   ConsoleWrite($Archive_Dir&"Archive\"&$CamArr[$i]&"\2016\"&@CRLF)
   While $sFileName <> 0
    $ArchMonthList[$MonthCounter] = $sFileName
	ConsoleWrite("incycle-i= "&$i&" FileName =  "&$sFileName&" $ArchMonthList =  "&$ArchMonthList[$MonthCounter]&" Mcounter = "&$MonthCounter&@CRLF)
	$sFileName = FileFindNextFile($ASearch)
$MonthCounter = $MonthCounter + 1
 wend
 $i=$i+1
ConsoleWrite("Last i= "&$i&"  "&" MinMonth= "&_ArrayMin ($ArchMonthList, 0, 0)&@CRLF)
$sFileName = 0
   WEnd


 MsgBox($MB_SYSTEMMODAL, "Check free", "Total Size  " & Ceiling($PathData[1]/1000000000) & @CRLF & "  Free C:\ " & Ceiling($PathData[0]/1000000000) & " Gb" & @CRLF & " Free L:\ " & Ceiling($PathArchive[0]/1000000000) & " Gb" )



If Ceiling($PathData[0]/1000000000) < $CCTV_Min Then

If Ceiling($PathArchive[0]/1000000000) > $Archive_Min Then
      MsgBox($MB_SYSTEMMODAL, "Check free", "Total Size  " & Ceiling($PathData[1]/1000000000) & "  Free C:\ " & Ceiling($PathData[0]/1000000000) & " Gb" & @CRLF & "LDrive Free  " & Ceiling($PathArchive[0]/1000000000) & " Gb" )
Elseif 4>3 Then
      MsgBox($MB_SYSTEMMODAL, "Check free", "ELSEIF  " )
Else
     MsgBox($MB_SYSTEMMODAL, "Check free", "ELSE  " )
EndIf

EndIf
