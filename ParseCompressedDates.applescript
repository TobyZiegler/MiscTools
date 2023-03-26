#
# ParseCompressedDates
#
# Created by Toby Ziegler, March 25 2023
# Last updated by Toby on March 25 2023
#
#
# This AppleScript was originally intended as a simple scratch script:
# Figure out how to parse a bunch of data from a compressed file then throw the scratches away.
#
# It ended up feeling like something worth keeping around.
#
# It uses a trick to extract the file dates by identifying lines beginning with a permissions character, then moving to the first colon to find the characters before and after making up the date.
# If any of those characters are different, out of order, or whatever, it will likely return gibberish instead of strings looking like dates.
# Oh, once determined the colon is always at 50, making the date from 38 to 52, it would have been easy to just hard code those numbers. I wanted the script to be more versatile than that. No telling what it might be the basis for in the future, after all!
#

--just fyi: this is the data obtained from compressing a few random files
set myTestText to "Archive:  /Users/tziegle/Documents/altTestingFolder/ArchiveTestToo.zip
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

parseDates(myTestText)

#####################################


on parseDates(myText)
	
	set AppleScript's text item delimiters to {character id 10, character id 13} --ascii return and linefeed
	
	set myItems to text items of myText --pull everything between each delimiter as an item in an array
	
	set AppleScript's text item delimiters to "" --reset delimiters, no longer needed
	
	set myDates to {}
	
	repeat with i from 1 to the count of myItems
		
		set myMatch to item i of myItems
		
		set targetLine to {"-", "r", "w"} --only the file lines begin with permission characters
		
		repeat with x from 1 to count of targetLine
			
			try --necessary for unusual characters
				if character 1 of myMatch is item x of targetLine then
					
					--using a colon and grabbing the text around it is the part making this only work for the kind of data supplied
					set colonPosition to offset of ":" in myMatch
					
					set thisDate to {text (colonPosition - 12) thru (colonPosition + 2) of myMatch}
					
					set end of myDates to thisDate
				end if
			end try
		end repeat
	end repeat
	
	return myDates
	
end parseDates