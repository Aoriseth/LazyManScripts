#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


Process, Exist, KeePass.
If (ErrorLevel){
	MsgBox, "Please run KeePass"
	Return
}

vpnStatus:=ComObjCreate("Wscript.Shell").Exec("powershell.exe Get-VpnConnection Toyota | Select -ExpandProperty 'ConnectionStatus'").StdOut.ReadAll()

If (InStr(vpnStatus,"Disconnected")){
	vpnConnect()
	Return
}Else{
	vnpDisconnect()
	Return
}

getMobilePassKey(){
	Run, C:\Programs\WindowsStore\MobilePASS
	WinWaitActive, MobilePASS
	Sleep, 1000
	Click, 500, 600
	Sleep, 200
	Send, !^a
	Sleep, 200
	Click, 500, 910
}


closeWindows(){
	WinClose, Settings
	WinClose, MobilePASS
}

gotoVpnSettings(){
	Send #i
	WinActivate, Settings
	WinWaitActive, Settings
	Sleep, 1000
	SendInput, {Raw}vpn
	Sleep, 500
	WinGetPos, X,Y,Width,Height,Settings
	; MsgBox, X:%X% Y:%Y% Width:%Width%/2 Height:%Height%
	X:=Width/2
	; MsgBox, X:%X% Y:%Y% Width:%Width%/2 Height:%Height%
	; ControlClick, x%X% y%Y%,Settings,,,,Pos
	Click, %X%, 355
	Sleep,200
	Click, %X%, 465
	Sleep, 200
	Return X
}

vnpDisconnect(){
	closeWindows()
	gotoVpnSettings()
	Send, {Tab}
	Send, {Tab}
	Sleep, 100
	Send, {Enter}

	Sleep, 250
	closeWindows()
	MsgBox, , VPN Connection, Connection Broken, 1
}

vpnConnect(){
	closeWindows()
	X:=gotoVpnSettings()

	Send, {Tab}
	Sleep, 200
	Send,{Enter}

	getMobilePassKey()

	WinActivate, Settings
	WinWaitActive, Settings
	Sleep, 1000
	Click, %X%,735
	Sleep, 100
	Send,^v
	Send,{Enter}
	Sleep, 200
	Click, %X%,735
	Sleep, 1000
	Send,{Tab}
	Sleep, 100
	Send,{Space}
	Sleep, 500
	Send,{Tab}
	Sleep, 100
	Send,{Space}
	Sleep, 500
	Send,{Tab}
	Sleep, 100
	Send,{Space}

	Sleep, 250
	closeWindows()
	MsgBox, , VPN Connection, Connection Established, 1
	; ControlSend,+{Tab}, Settings
	; ControlSend,+{Tab}, Settings
	; ControlSend, ^v, Settings
	; ControlSend,{Enter}, Settings
}

