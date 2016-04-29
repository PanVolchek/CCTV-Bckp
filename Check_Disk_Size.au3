#include <WinAPIFiles.au3>
#include <Constants.au3>
#include <Array.au3>


Local $PathData = _WinAPI_GetDiskFreeSpaceEx("C:")
Local $PathArchive = _WinAPI_GetDiskFreeSpaceEx("L:")
Local $CCTV_Dir = "L:\"
Local $Archive_Dir = "C:\TEMP\"
Local $CCTV_Min = 200
Local $Archive_Min = 10
;Список камер
Local $CamArr = ["DespArea1", "DespArea2", "FSA-LD", "FSA-RP", "Portal", "RSA"]
Local $ArchMonthList [12] = ["99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99"]
Local $ArchDayList [32] = ["99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99", "99"]
;Local $ASearch = FileFindFirstFile($Archive_Dir&"Archive\"&$CamArr[1]&"2016\*.*")
;Local $ASearch = FileFindFirstFile("*.*")
Local $sFileName = ""
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
#comments-start

While $i<6
   FileChangeDir($Archive_Dir&"Archive\"&$CamArr[$i]&"\2016\")
   $MonthCounter = 0
   Local $ASearch = FileFindFirstFile("*.*")

    $sFileName = FileFindNextFile($ASearch)
   ConsoleWrite($Archive_Dir&"Archive\"&$CamArr[$i]&"\2016\"&"   FuncMinMonth = "&@CRLF)
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


#comments-end

Func MinDataArch(ByRef $CamRef)
local $MinArchPath
local $MCounter
local $DCounter
$MCounter = 0
$DCounter = 0

FileChangeDir($Archive_Dir&"Archive\"&$CamRef&"\2016\")
;Ищем минимальный месяц в $ArchMonthList[$MonthCounter] = $sFileName
   Local $ASearch = FileFindFirstFile("*.*")
    $sFileName = FileFindNextFile($ASearch)

While $sFileName <> 0
    $ArchMonthList[$MCounter] = $sFileName
	;ConsoleWrite(" $ArchMonthList =  "&$ArchMonthList[$MCounter]&" Mcounter = "&$MCounter&@CRLF)
	$sFileName = FileFindNextFile($ASearch)
$MCounter = $MCounter + 1
 wend
;ConsoleWrite(" MinMonth= "&_ArrayMin ($ArchMonthList, 0, 0)&@CRLF)

;Ищем минимальный День
;ConsoleWrite("----------Day-----------"&@CRLF)
;ConsoleWrite($Archive_Dir&"Archive\"&$CamRef&"\2016\"&_ArrayMin ($ArchMonthList, 0, 0)&@CRLF)
FileChangeDir($Archive_Dir&"Archive\"&$CamRef&"\2016\"&_ArrayMin ($ArchMonthList, 0, 0))
$ASearch = FileFindFirstFile("*.*")
$sFileName = FileFindNextFile($ASearch)
While $sFileName <> 0
    $ArchDayList[$DCounter] = $sFileName
	;ConsoleWrite(" $ArchDayList =  "&$ArchDayList[$DCounter]&" Dcounter = "&$DCounter&@CRLF)
	$sFileName = FileFindNextFile($ASearch)
$DCounter = $DCounter + 1
 wend
$MinArchPath = $Archive_Dir&"Archive\"&$CamRef&"\2016\"&_ArrayMin ($ArchMonthList, 0, 0)&"\"&_ArrayMin ($ArchDayList, 0, 0)
;ConsoleWrite(" MinDate At all = "&$MinArchPath&@CRLF)

;ConsoleWrite(" Current Cam is "&$CamRef&"  "&@CRLF&" $ASearch = "&$ASearch&" $sFileName = "&$sFileName&@CRLF)
Return $MinArchPath
EndFunc

While $i<6
ConsoleWrite("MinDataArch = "&MinDataArch($CamArr[$i])&@CRLF)

;MsgBox($MB_SYSTEMMODAL, "Check free", "Total Size  " & Ceiling($PathData[1]/1000000000) & @CRLF & "  Free C:\ " & Ceiling($PathData[0]/1000000000) & " Gb" & @CRLF & " Free L:\ " & Ceiling($PathArchive[0]/1000000000) & " Gb" )
$i = $i + 1
wend

If Ceiling($PathData[0]/1000000000) < $CCTV_Min Then

If Ceiling($PathArchive[0]/1000000000) > $Archive_Min Then
      MsgBox($MB_SYSTEMMODAL, "Check free", "Total Size  " & Ceiling($PathData[1]/1000000000) & "  Free C:\ " & Ceiling($PathData[0]/1000000000) & " Gb" & @CRLF & "LDrive Free  " & Ceiling($PathArchive[0]/1000000000) & " Gb" )
Elseif 4>3 Then
      MsgBox($MB_SYSTEMMODAL, "Check free", "ELSEIF  " )
Else
     MsgBox($MB_SYSTEMMODAL, "Check free", "ELSE  " )
EndIf

EndIf
