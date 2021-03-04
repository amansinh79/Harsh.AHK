#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force


;chrome
!c::Run, chrome.exe , , Max
!F1::Run, chrome.exe stackoverflow.com, , Max
!F2::Run, chrome.exe youtube.com, , Max
!F3::Run, chrome.exe stackoverflow.com, , Max
return


;alt+tab shortcuts
F1::WinActivate, ahk_exe WindowsTerminal.exe
F2::WinActivate, ahk_exe vscode.exe
F3::WinActivate, ahk_exe chrome.exe


;Opening Terminal in current directory
<#t::
    ActiveExplorerPath := % Trim(GetActiveExplorerPath()) 
    if(ActiveExplorerPath) ; if explorer path exist 
     Run, wt -d "%ActiveExplorerPath%"
    else ; run default directory 
     Run, wt -d E:/
   return


;Opening VScode in windows terminal if terminal exist

<#v::
    #IfWinExist ahk_exe WindowsTerminal.exe 
    WinActivate, ahk_exe WindowsTerminal.exe
    SendInput code .{Enter}
return


;git commands
#IfWinActive ahk_exe WindowsTerminal.exe
::push::git push -u origin main
::commit::git commit -m ""{Left}
::add::git add .

return



;gets current path of explorer if explorer is open
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