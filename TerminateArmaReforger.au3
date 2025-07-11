#NoTrayIcon
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <TrayConstants.au3> ; Required for the $TRAY_ICONSTATE_SHOW constant.

; Variables
$title = "Arma Reforger Terminator"

Opt("TrayMenuMode", 3) ; The default tray menu items will not be shown and items are not checked when selected. These are options 1 and 2 for TrayMenuMode.

StartListening()

Func StartListening()
    ; Add items to system tray
    Local $idAbout = TrayCreateItem("About")
    Local $idExit = TrayCreateItem("Exit")

    ; Tray menu
    TraySetState($TRAY_ICONSTATE_SHOW)
    TraySetToolTip($title)
    TraySetIcon(@ScriptName)
    
    ; Start listening for hotkeys
    HotKeySet("^!{F4}", "TerminateArmaReforger") ; CTRL + ALT + F4

    ; Loop and wait for hotkey or exit item
    While 1               
            Switch TrayGetMsg()
                Case $idAbout
                    MsgBox($MB_SYSTEMMODAL, "", "Press CTRL + ALT + F4 to terminate Arma Reforger." & @CRLF & _
                    "It will save your spot for a few minutes." & @CRLF & @CRLF & _
                    "I made this for Yas & Ray <3")
                Case $idExit ; Exit the loop.
                    ExitLoop
            EndSwitch
    WEnd
EndFunc

Func TerminateArmaReforger()
    ; AutoIt script to terminate the process ArmaReforgerSteam.exe
    $processName = "ArmaReforgerSteam.exe"

    ; Close the process
    ProcessClose($processName)
EndFunc