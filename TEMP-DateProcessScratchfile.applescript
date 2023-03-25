set myText to "-rw-r--r-- 2.0 unx 11033 bX defN 23-Mar-24 13:22 BEN_Conf_Stmt.pdf
-rw-r--r-- 2.0 unx 627 bX defN 23-Mar-24 13:22 __MACOSX/._BEN_Conf_Stmt.pdf
-rw-r--r-- 2.0 unx 31438 bX defN 23-Mar-24 10:30 5920 Cardio rehab consent 03 22 2023 clean.docx"
set AppleScript's text item delimiters to linefeed
set myItems to text items of myText
set AppleScript's text item delimiters to "" --reset, no longer needed
set myDates to {}
repeat with myItem in myItems
	set myMatch to item 1 of myItems as string
	set colonPosition to offset of ":" in myMatch
	set thisDate to {text (colonPosition - 12) thru (colonPosition + 2) of myMatch}
	set end of myDates to thisDate
end repeat
return myDates