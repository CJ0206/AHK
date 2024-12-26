#Requires Autohotkey v2.0
; V1toV2: Made functions global and added brackets

; Notes for coding:
; ^ for Ctrl
; ! for Alt
; # for Win
; + for Shift

; Turn on NumLock by default
SetNumLockState("On")

; Alt+Space = Always on top for the selected window
!SPACE::WinSetAlwaysOnTop(-1, "A")

; Home = copy (Ctrl + C)
Home::^c

; End = paste (Crtl + V)
End::^v

; Alt+Scroll wheel (and Mbutton) = Volume control
Alt & WheelUp::Volume_Up
Alt & WheelDown::Volume_Down
Alt & MButton::Volume_Mute

; Alt + S = Checks if a program is open, and sends a message if it's already open, or opens program if it's not, + open website in a new window
!S::
{
global
	if WinExist("ahk_exe <program.exe>")
		MsgBox("<program> is already running.")
	Else
		Run("<programPath\program.exe>")

	Sleep(200)
	Run("chrome.exe <fullURL> `" --new-window `"")
return
}

; Windows Key + L = Turn off monitor after locking system
#L::
{
global
	Sleep(200)
	DllCall("LockWorkStation")
	Sleep(200)
	ErrorLevel := SendMessage(0x112, 0xF170, 2, , "Program Manager")
 return
}

; Windows Key + Q = Send text, send tab, send text as string, send enter
#Q::
{
global
	Send("Sends text but not certain characters")
	Send("`t")
	Send("{Raw}Sends any keys as a raw string (i.e. you can use ^!#+ etc, without issues)")
	Send("{ENTER}")
return
} ; V1toV2: Added bracket in the end
