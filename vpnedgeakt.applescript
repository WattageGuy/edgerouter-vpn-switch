tell application "Terminal"
	activate
	set currentTab to do script ("ssh user@192.168.1.1")
	do script ("configure") in currentTab
	-- Turning on rules that opens VPN connection
	do script ("delete firewall name WAN_LOCAL rule 40 disable") in currentTab
	do script ("delete firewall name WAN_LOCAL rule 50 disable") in currentTab
	do script ("delete firewall name WAN_LOCAL rule 60 disable") in currentTab
	do script ("delete firewall name WAN_LOCAL rule 70 disable") in currentTab
	do script ("commit") in currentTab
	do script ("save") in currentTab
	do script ("exit") in currentTab
	-- Trying to close connection 10 times. Lag etc can make it run slower then expected and therefore 10 tries
	try
		repeat 10 times
			delay 10
			do script ("exit") in currentTab
		end repeat
	end try
end tell
