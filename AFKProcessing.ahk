#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#NoTrayIcon
#Persistent

total_loops := 0

ifWinNotExist, METAL GEAR SOLID V: THE PHANTOM PAIN
	MsgBox, 0, Error - MSGV: TPP not found, METAL GEAR SOLID V: THE PHANTOM PAIN not found. Please start it before launching AFKProcessing.
	
Settimer, Instructions, 720000 ; calls "Instructions" every ~12 Minutes (Material Processing Rank B)
Gosub Instructions ; to start the first loop immediately if wanted
return

Instructions:
IfWinNotActive, METAL GEAR SOLID V: THE PHANTOM PAIN
	WinActivate, METAL GEAR SOLID V: THE PHANTOM PAIN
WinWaitActive, METAL GEAR SOLID V: THE PHANTOM PAIN
Send, {Tab}
Sleep, 1000
Send, {Tab}
Sleep, 100
total_loops := total_loops + 1
return	

^!m::
{
	MsgBox, 4096, AFKProcessing was Stopped, A total of %total_loops% material processes were made.
	ExitApp
}
