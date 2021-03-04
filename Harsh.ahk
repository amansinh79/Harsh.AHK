#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

<#c::Run, chrome.exe, , Max

<#t::
    ActiveExplorerPath := % Trim(GetActiveExplorerPath()) 
    if(ActiveExplorerPath) ; if explorer path exist 
     Run, wt -d "%ActiveExplorerPath%"
    else ; run default directory 
     Run, wt -d E:/Hell
   return


; gets current path of explorer if explorer is open
GetActiveExplorerPath() {
    explorerHwnd := WinActive("ahk_class CabinetWClass")
    if (explorerHwnd)
    {
        for window in ComObjCreate("Shell.Application").Windows
        {
            if (window.hwnd==explorerHwnd)
                return window.Document.Folder.Self.Path
        }
    }
}