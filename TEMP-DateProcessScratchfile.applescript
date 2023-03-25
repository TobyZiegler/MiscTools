set myText to "-rw-r--r-- 2.0 unx 11033 bX defN 23-Mar-24 13:22 BEN_Conf_Stmt.pdf
-rw-r--r-- 2.0 unx 627 bX defN 23-Mar-24 13:22 __MACOSX/._BEN_Conf_Stmt.pdf
-rw-r--r-- 2.0 unx 31438 bX defN 23-Mar-24 10:30 5920 Cardio rehab consent 03 22 2023 clean.docx"
log myText

set AppleScript's text item delimiters to linefeed
log "delimimeters: " & AppleScript's text item delimiters

set myItems to text items of myText
log "myItems: " & (count of myItems) & " items, which are:" & linefeed & myItems

set AppleScript's text item delimiters to "" --reset, no longer needed

set myDates to {}
repeat with myItem in myItems
	set myMatch to item 1 of myItems as string
	log "myMatch: " & linefeed & myMatch
	
	--set myMatch to (myItem as string) = myRegex
	set colonPosition to offset of ":" in myMatch
	set thisDate to {text (colonPosition - 12) thru (colonPosition + 2) of myMatch}
	set end of myDates to thisDate
end repeat
return myDates

(*
	if myMatch is not {} then
		set myDate to item 1 of item 1 of myMatch
		set myTime to item 1 of item 2 of myMatch
		set end of myDates to {myDate, myTime}
	end if
end repeat
set AppleScript's text item delimiters to ""
return myDates
*)


(*
set aList to {"1", "2", "3", "4", "5"}

repeat with anItem in aList
    set value to item 1 of anItem
    if value is not "3" then log value
end repeat


set theScript to "echo \"" & filename & "\"|sed \"s/[0-9]\\{10\\}/*good*(&)/\"" as string
set sedResult to do shell script theScript
set isgood to sedResult starts with "*good*"

*)