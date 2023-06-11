/*
This AHK script is built to use WASD keys with HOI4. To use those keys in-game use shift+w,a,s,d.

Instruction:
    - ctrl+f9 to start locally in VS code
    - Use https://www.autohotkey.com/docs/v2/lib/MsgBox.htm
*/
^!esc::ExitApp
OnError ErrorOccurred
SetTimer ChangeButtonNames, 50
Result := MsgBox("Would you like to start the game automatically or go to the launcher? (Press Game or Launcher)", "HOI4 AutoHotKey","3 T30")

if (Result == "Yes")
    Run "C:\Program Files (x86)\Steam\steamapps\common\Hearts of Iron IV\hoi4.exe"
else if (Result == "No")
    Run "steam://rungameid/394360" ; This value is derived from the shortcut Steam makes.
else    
    CheckIntentions
; This will check if Hoi4.exe is active
#HotIf WinActive("ahk_exe hoi4.exe")

; Change wasd to up, left, down and right respectively
w::up
a::left
s::down
d::right

; To use wasd just use the corresponding key with shift (shift+w = w, shift+a=a, etc)
+w::w
+a::a
+s::s
+d::d

CheckIntentions(){
    Result := MsgBox("Would you like to start script normally? (Yes or No)", "Yes/No","4 T30")
    if Result == "No"
        ExitApp
}

ErrorOccurred(exception, mode){
    MsgBox("An unrecoverable error occurred: `r`r The Steam shortcut filepath is incorrect", "ERROR", "T20")
    ExitApp
}

ChangeButtonNames()
{
    if !WinExist("HOI4 AutoHotKey")
        return  ; Keep waiting.
    SetTimer , 0
    WinActivate
    ControlSetText "&Game", "Button1"
    ControlSetText "&Launcher", "Button2"
}