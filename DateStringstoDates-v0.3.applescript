#
# DateStringstoDates
#
# Created by Toby Ziegler, March 26 2023
# Last updated by Toby on March 27 2023
#
# Designating this script as version 0.3
#
# This AppleScript was originally intended as a simple scratch script:
# Figure out how to convert some strings from zipinfo'd PDFs into dates.
#
# It ended up feeling like another something worth keeping around.
#
# Code dusted off, and still only works on the exactly formatted input.
# No accommodation for anything but local time.
#
#

set myTestDates to {"20220224.132241", "20210124.132241", "20230324.103035", "20230324.103035", "20230324.094456", "20230324.094456", "20230324.091848", "20230324.091848", "20230322.150704", "20230322.150704", "20230322.150704", "20230322.150704", "20230322.143527", "20230322.143527", "20230322.143310", "20230322.143310"}

parseDateStrings(myTestDates)

#####################################


on parseDateStrings(myDateStrings)
	
	set myDates to {}
	
	repeat with i from 1 to the count of myDateStrings
		
		set thisDate to item i of myDateStrings
		
		--since the format is known, specifying positions obtains the data
		set theYear to text 1 thru 4 of thisDate
		set theMonth to text 5 thru 6 of thisDate
		set theDay to text 7 thru 8 of thisDate
		set theHour to text 10 thru 11 of thisDate
		set theMinute to text 12 thru 13 of thisDate
		set theSecond to text 14 thru 15 of thisDate
		
		set dateString to theMonth & "/" & theDay & "/" & theYear
		
		set myDate to date dateString --unable to add date and time together
		
		--quirky thing doesn't work if multiply by seconds, just add them raw
		set time of myDate to (theHour * hours + theMinute * minutes + theSecond)
		
		set end of myDates to myDate
		
	end repeat
	
	return myDates
	
end parseDateStrings