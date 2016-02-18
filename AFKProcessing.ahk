#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, Force ; when a new instance of the script is started the old one is closed
#NoTrayIcon ; no green "H"-icon in the tray
#Persistent ; not necessarily needed because script contains a hotkey

total_loops := 0 ; variabe to count how many times the loop was executed

ifWinNotExist, METAL GEAR SOLID V: THE PHANTOM PAIN ; checks if MGSV-TPP is opened
{
	MsgBox, 0, Error - MSGV: TPP not found, METAL GEAR SOLID V: THE PHANTOM PAIN not found. Please start it before launching AFKProcessing.
	ExitApp
}
Settimer, Instructions, 720000 ; calls "Instructions" every ~12 Minutes (Material Processing Rank B)
Gosub Instructions ; to start the first loop immediately if wanted
return

Instructions:
WinGetActiveTitle, old_window ; saves the currently active window
IfWinNotActive, METAL GEAR SOLID V: THE PHANTOM PAIN ; activates MGSV-TPP if not already active
	WinActivate, METAL GEAR SOLID V: THE PHANTOM PAIN
WinWaitActive, METAL GEAR SOLID V: THE PHANTOM PAIN ; waits till MGSV-TPP is active
Send, {Tab}
Sleep, 1000 ; needs optimization for slower/(faster) PCs
Send, {Tab}
Sleep, 100
WinActivate, %old_window% ; restores the active window before the loop was executed
total_loops := total_loops + 1 ; loop count up
return	

^!m:: ; hotkey to end the script
{
	MsgBox, 4096, AFKProcessing was stopped, You have stopped AFKProcessing by pressing the hotkey. `n`nA total of %total_loops% material processes were made.
	ExitApp
}
