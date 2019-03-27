#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


Process, Exist, KeePass.
If (ErrorLevel){
	MsgBox, "Please run KeePass"
	Return
}

WinClose, Settings
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
ControlClick, x1030 y355,Settings,,,,Pos
Sleep,200

; Send {Enter}
; Sleep, 200
; Send {Enter}
; Sleep, 200
; Send, {Tab}
; Sleep, 200
; Send, {Enter}
; Sleep, 100
; Send, {Tab}
; Sleep, 100
; Send, {Enter}

; Run, C:\Programs\WindowsStore\MobilePASS
; WinWaitActive, MobilePASS
; Sleep, 1000
; SetTitleMatchMode, 2
; ControlClick, "Toyota", MobilePASS
; MouseClick, Left, 500, 570
; Sleep, 200
; Send, !^a
; Sleep, 200
; MouseClick, Left, 500, 910

; WinActivate, Settings
; WinWaitActive, Settings
; Sleep, 10000
; ControlSend,+{Tab}, Settings
; ControlSend,+{Tab}, Settings
; ControlSend, ^v, Settings
; ControlSend,{Enter}, Settings
