#!/usr/bin/env bash
read -d '' AppleScript <<EOF
tell application "System Preferences"
    activate
    reveal pane id "com.apple.preference.displays"
    delay 1
    tell application "System Events" to click pop up button "Add Display" of window "Displays" of application process "System Preferences" of application "System Events"
    delay 1
    tell application "System Events"  to click last menu item of menu "Add Display" of pop up button "Add Display" of window "Displays" of application process "System Preferences" of application "System Events"
end tell
tell application "System Events"
    tell front window of (first application process whose frontmost is true)
	    set uiElems to entire contents
    end tell
end tell
EOF
osascript -e "$AppleScript"