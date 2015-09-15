#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Add link to script to Windows A_Startup

SplitPath, A_Scriptname, , , , OutNameNoExt 
    LinkFile=%A_Startup%\%OutNameNoExt%.lnk 
    IfNotExist, %LinkFile% 
      FileCreateShortcut, %A_ScriptFullPath%, %LinkFile% 
    SetWorkingDir, %A_ScriptDir%


^q::
SendInput ^c

Sleep 500

OldStr = %Clipboard%

StringReplace, NewStr, OldStr, %A_SPACE%, , All
StringReplace, OldStr, NewStr, `r,, 2
StringReplace, NewStr, OldStr, `n,, 2

Clipboard = %NewStr%
