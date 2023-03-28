#
# DateStringstoDates
#
# Created by Toby Ziegler, March 26 2023
# Last updated by Toby on March 27 2023
#
# Designating this script as version 0.2
#
# This AppleScript was originally intended as a simple scratch script:
# Figure out how to convert some strings into dates.
#
# It ended up feeling like another something worth keeping around.
#
# It now works a lot less clumsy. Time for cleanup.
# Also, it still only works on the exactly formatted input.
#
#

set myTestDates to {"20220224.132241", "20210124.132241", "20230324.103035", "20230324.103035", "20230324.094456", "20230324.094456", "20230324.091848", "20230324.091848", "20230322.150704", "20230322.150704", "20230322.150704", "20230322.150704", "20230322.143527", "20230322.143527", "20230322.143310", "20230322.143310"}

parseDateStrings(myTestDates)

#####################################


on parseDateStrings(myDateStrings)
	
	set testDateString to "12/31/1968"
	set testDate to date testDateString
	--set time of testDate to "02:36.14"
	log "String: " & testDateString
	log "Test: " & testDate
	
	
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
		
		(*
		scratch this part, it looks like it can be done short form after all.
		--turning the values into a string of this specific format allow "date" to function later: "mm/dd/yyyy, hh:mm.ss" 
		set dateString to theDay & "/" & theMonth & "/" & theYear & ", " & theHour & ":" & theMinute & "." & theSecond
		set timeString to theHour & ":" & theMinute & "." & theSecond
		*)
		
		set dateString to theMonth & "/" & theDay & "/" & theYear
		log "dateString: " & dateString
		--log "timeString: " & timeString
		
		set myDate to date dateString
		log "myDate: " & myDate
		
		(*
		scratch this too, it worked with one line below
		--unable to successfully load time any other way, so one at a time.
		set hours of myDate to theHour
		log "add hours: " & myDate
		set minutes of myDate to theMinute
		log "add minutes: " & myDate
		set seconds of myDate to theSecond
		log "add seconds: " & myDate
		*)
		
		--quirky thing doesn't work if multiply by seconds, just add them raw
		set time of myDate to (theHour * hours + theMinute * minutes + theSecond)
		
		--set [_day, _month, _year] to [day, month, year] of date today
		
		--set [hours, minutes, seconds] of myDate to [theHour, theMinute, theSecond]
		log "add time: " & myDate
		
		
		set end of myDates to myDate
	end repeat
	
	--set theDate to date (text 1 thru 8 of item 1 of myDateStrings)
	--set myDates to {day:d, month:m, year:y} as date
	--set myDates to date builtDate
	
	(*
	set myDates to {}
	
	
	--set theYear to the year of the (current date)
	
	repeat with i from 1 to the count of myDateStrings
		
		set theDate to current date
		
		set myDate to item i of myDateStrings as string
		log "myDate: " & myDate
		
		set year of theDate to text 1 thru 4 of myDate
		log "add year: " & theDate
		
		set month of theDate to text 5 thru 6 of myDate
		log "add month: " & theDate
		
		set day of theDate to text 7 thru 8 of myDate
		log "add day: " & theDate
		
		set time of theDate to (text 10 thru 11 of myDate) * hours + (text 12 thru 13 of myDate) * minutes
		log "add time: " & theDate
		
		set end of myDates to theDate
	end repeat
	*)
	
	log "myDates: " & linefeed & myDates
	
	return myDates
	
end parseDateStrings