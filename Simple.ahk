; Notes for coding:
; ^ for Ctrl
; ! for Alt
; # for Win
; + for Shift

; Turn on NumLock by default
SetNumLockState, On

; Alt+Space activates Always on top for the selected window
!SPACE::  Winset, Alwaysontop, , A

; Home to copy
Home::^c

; End to paste
End::^v

; Volume control, Alt+Scroll wheel (and Mbutton)
Alt & WheelUp::Volume_Up
Alt & WheelDown::Volume_Down
Alt & MButton::Volume_Mute

; Alt + S opens program + website
!S::
	IfWinExist, ahk_exe <program.exe>
		MsgBox <program> is already running.
	Else
		Run, <programPath\program.exe>

	Sleep, 200
	Run, chrome.exe <fullURL> " --new-window "
return

; Windows Key + L = Turn off monitor after locking system
#L::
	Sleep, 200
	DllCall("LockWorkStation")
	Sleep, 200
	SendMessage,0x112,0xF170,2,,Program Manager
 return
