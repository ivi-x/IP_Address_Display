repeat
	try
		set LANIP to (do shell script "ipconfig getifaddr en1")
		exit repeat
	on error
		set LANIP to "Not connected to a network"
		set WANIP to "Not connected to the internet"
		display dialog "Not connected. Try again?"
	end try
end repeat
try
	do shell script "curl http://checkip.dyndns.org/ | grep 'Current IP Address' | cut -d : -f 2 | cut -d \\< -f 1"
	set WANIP to (characters 2 through -1 of result) as text -- Get IP
on error
	set WANIP to "Not connected to the internet"
end try

display dialog "WAN: " & WANIP & " - LAN: " & LANIP & "

You can copy the text below" with title "IP Address" default answer WANIP & " - " & LANIP
