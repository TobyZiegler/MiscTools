set myText to "Archive:  /Users/tziegle/Documents/altTestingFolder/ArchiveTestToo.zip
Zip file size: 1620465 bytes, number of entries: 16
-rw-r--r--  2.0 unx    11033 bX defN 23-Mar-24 13:22 BEN_Conf_Stmt.pdf
-rw-r--r--  2.0 unx      627 bX defN 23-Mar-24 13:22 __MACOSX/._BEN_Conf_Stmt.pdf
-rw-r--r--  2.0 unx    31438 bX defN 23-Mar-24 10:30 5920 Cardio rehab consent 03 22 2023 clean.docx
-rw-r--r--  2.0 unx      333 bX defN 23-Mar-24 10:30 __MACOSX/._5920 Cardio rehab consent 03 22 2023 clean.docx
-rw-r--r--  2.0 unx   182899 bX defN 23-Mar-24 09:44 Blood Drive - Coxhealth Meal Voucher.pdf
-rw-r--r--  2.0 unx      277 bX defN 23-Mar-24 09:44 __MACOSX/._Blood Drive - Coxhealth Meal Voucher.pdf
-rw-r--r--  2.0 unx     9415 bX defN 23-Mar-24 09:18 Continuum Paper Ticket Revision.xlsx
-rw-r--r--  2.0 unx      333 bX defN 23-Mar-24 09:18 __MACOSX/._Continuum Paper Ticket Revision.xlsx
-rw-r--r--  2.0 unx  1799190 bX defN 23-Mar-22 15:07 Re- 1685 IPPV-NPPV Patient History Questions.eml
-rw-r--r--  2.0 unx      277 bX defN 23-Mar-22 15:07 __MACOSX/._Re- 1685 IPPV-NPPV Patient History Questions.eml
-rw-r--r--  2.0 unx    15721 bX defN 23-Mar-22 15:07 Vent Checkout Form[1].docx
-rw-r--r--  2.0 unx      277 bX defN 23-Mar-22 15:07 __MACOSX/._Vent Checkout Form[1].docx
-rw-r--r--  2.0 unx    79121 bX defN 23-Mar-22 14:35 288744_ExerciseCard_03162023_LO.docx
-rw-r--r--  2.0 unx      684 bX defN 23-Mar-22 14:35 __MACOSX/._288744_ExerciseCard_03162023_LO.docx
-rw-r--r--  2.0 unx    15721 bX defN 23-Mar-22 14:33 Vent Checkout Form.docx
-rw-r--r--  2.0 unx      333 bX defN 23-Mar-22 14:33 __MACOSX/._Vent Checkout Form.docx
16 files, 2147679 bytes uncompressed, 1616679 bytes compressed:  24.7%"
log myText

set AppleScript's text item delimiters to {character id 10, character id 13}
log "delimimeters: " & AppleScript's text item delimiters

set myItems to text items of myText
log "myItems: " & (count of myItems) & " items, which are:" & linefeed & myItems

set AppleScript's text item delimiters to "" --reset, no longer needed

set myDates to {}
repeat with i from 1 to the count of myItems
	set myMatch to item i of myItems
	log "myMatch: " & linefeed & myMatch
	
	set targetLine to {"-", "r", "w"} --only the file lines begin with permissions
	log "First: " & character 1 of myMatch
	
	repeat with x from 1 to count of targetLine
		if character 1 of myMatch is item x of targetLine then
			set colonPosition to offset of ":" in myMatch
			set thisDate to {text (colonPosition - 12) thru (colonPosition + 2) of myMatch}
			log "thisDate: " & thisDate
			set end of myDates to thisDate
		end if
	end repeat
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



