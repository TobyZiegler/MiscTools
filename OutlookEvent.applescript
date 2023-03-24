(* AppleScript to schedule an event with the selected text as the subject *)

--set SelectedItem to Input

set mySubject to "Test Subject"
set myStart to current date
set myEnd to (current date) + 2700

tell application "Microsoft Outlook"
	set newEvent to make new calendar event with properties Â
		{subject:mySubject, start time:myStart, end time:myEnd, has reminder:false}
	set theCategoryList to categories of newEvent
	set end of theCategoryList to category "@Work"
	set category of newEvent to theCategoryList
end tell



(* scratch script excerpts *)

tell application "Finder"
	get the name of every process whose visible is true
end tell