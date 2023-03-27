#
# DateStringstoDates
#
# Created by Toby Ziegler, March 26 2023
# Last updated by Toby on March 26 2023
#
#
# This AppleScript was originally intended as a simple scratch script:
# Figure out how to convert some strings into dates.
#
# It ended up feeling like something worth keeping around.
#
#

--just fyi: this is the data obtained from compressing a few random files
set myTestDates to {{"08-Mar-24 13:22"}, {"09-Mar-24 13:22"}, {"10-Mar-24 10:30"}, {"11-Mar-24 10:30"}, {"12-Mar-24 09:44"}, {"13-Mar-24 09:44"}, {"14-Mar-24 09:18"}, {"15-Mar-24 09:18"}, {"16-Mar-22 15:07"}, {"17-Mar-22 15:07"}, {"18-Mar-22 15:07"}, {"19-Mar-22 15:07"}, {"20-Mar-22 14:35"}, {"21-Mar-22 14:35"}, {"22-Mar-22 14:33"}, {"23-Mar-22 14:33"}}

parseDateStrings(myTestDates)

#####################################


on parseDateStrings(myDateStrings)
	
	log "myDateStrings: " & linefeed & item 1 of myDateStrings
	
	set myDates to {}
	
	repeat with i from 1 to the count of myDateStrings
		
		set theDate to current date
		set theYear to the year of the (current date)
		log "theYear: " & theYear
		
		set myDate to item i of myDateStrings as string
		
		--set myTest to text 1 thru 2 of myDate
		--log "myTest: " & myTest
		
		
		set theYY to text 1 thru 2 of myDate as number
		if (theYY + 2000) is greater than the year of the (current date) then
			theYY is theYY + 1900
			log theYY
		else
			theYY is theYY + 2000
			log theYY
		end if
		set year of theDate to theYY
		log "add year: " & theDate
		
		set day of theDate to text -1 thru -2 of ("0" & (text 8 thru 9 of myDate)) --> "02"
		log "add day: " & theDate
		
		
		(*
		set month of theDate to text 4 thru 6 of myDate
		log "add month: " & theDate
		
		set day of theDate to text 8 thru 9 of myDate
		
		set time of theDate to (text 11 thru 12 of myDate) * hours + (text 14 thru 15 of myDate) * minutes
		log "add time: " & theDate
		*)
		
		--set end of myDates to theDate
	end repeat
	
	return myDates
	
end parseDateStrings