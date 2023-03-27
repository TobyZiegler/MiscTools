#
# DateStringstoDates
#
# Created by Toby Ziegler, March 26 2023
# Last updated by Toby on March 27 2023
#
# Designating this script as version 0.1
#
# This AppleScript was originally intended as a simple scratch script:
# Figure out how to convert some strings into dates.
#
# It ended up feeling like another something worth keeping around.
#
# Not sure about it yet. It works, but feels clumsy.
# Also, it only works on the exactly formatted input.
#

set myTestDates to {{"08-Jan-01 13:22"}, {"09-Feb-02 13:22"}, {"10-Mar-03 10:30"}, {"11-Apr-04 10:30"}, {"12-May-05 09:44"}, {"13-Jun-06 09:44"}, {"14-Jul-07 09:18"}, {"15-Aug-08 09:18"}, {"16-Sep-09 15:07"}, {"17-Oct-10 15:07"}, {"18-Nov-11 15:07"}, {"19-Dec-12 15:07"}, {"20-Nov-13 14:35"}, {"21-Oct-14 14:35"}, {"22-Sep-15 14:33"}, {"23-Aug-16 14:33"}}

parseDateStrings(myTestDates)

#####################################


on parseDateStrings(myDateStrings)
	
	log "myDateStrings: " & linefeed & item 1 of myDateStrings
	
	set myDates to {}
	
	set theYear to the year of the (current date)
	
	repeat with i from 1 to the count of myDateStrings
		
		set theDate to current date
		
		set myDate to item i of myDateStrings as string
		
		set theYY to text 1 thru 2 of myDate as number
		if (theYY + 2000) is greater than theYear then
			set theYYYY to 1900 + theYY
			log "YY: " & theYY & ", YYYY: " & theYYYY
		else
			set theYYYY to 2000 + theYY
			log "YY: " & theYY & ", YYYY: " & theYYYY
		end if
		
		set year of theDate to theYYYY
		log "add year: " & theDate
		
		set day of theDate to text -1 thru -2 of ("0" & (text 8 thru 9 of myDate))
		log "add day: " & theDate
		
		set monthName to text 4 thru 6 of myDate
		set monthList to {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
		repeat with j from 1 to length of monthList
			if item j of monthList = monthName then
				exit repeat
			end if
		end repeat
		
		set month of theDate to j
		log "add month: " & theDate
		
		set time of theDate to (text 11 thru 12 of myDate) * hours + (text 14 thru 15 of myDate) * minutes
		log "add time: " & theDate
		
		set end of myDates to theDate
	end repeat
	log "myDates: " & linefeed & myDates
	
	return myDates
	
end parseDateStrings