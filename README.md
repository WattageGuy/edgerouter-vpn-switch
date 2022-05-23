# edgerouter-vpn-switch
Applescript/Shell scipt that enable/disable vpn on edgerouter via ssh. The script can then be exported as an app to be used even more widely (mac) or be used as shell script.

# Explanation
The script should not be used without ssh key if possible. You can keystroke password in applescript but this is not recommend do to security.
The script outputs commands to the edgerouters CLI to enable/disable vpn firewall rules so use your correct rule name.
This script relies on errors and therefor not exiting to early. But after 10 tries it closes to not make it run infinity if any other errors occurs (mac). You can export this file to a program or shell script. Every time you run it you will enable/disable your firewall. Se bottom of page for more....

# Setup
You have to configure firewall rules manually first time according to pictures below. Change the rule numbers in the script so that they correspond to the numbers on your firewall rules. This script only blocks VPN connections via firewall. First you need to configure and setup your vpn solution. I recommend using l2tp over iPsec. You can find tutorial about setting up a vpn on youtube especially for the edgerouter series.

--

You can activate/inactivate rules by adding/deleting this line in the script:

**activate:**
`do script ("delete firewall name WAN_LOCAL rule <your_firewall_rulenumber> disable") in currentTab`

**inactivate:**
`do script ("set firewall name WAN_LOCAL rule <your_firewall_rulenumber> disable") in currentTab`

Here are pictures of the GUI firewall rules:

**(I use default action drop)**
![interface](https://github.com/WattageGuy/edgerouter-vpn-switch/blob/main/pictures/interface.PNG)

ex of where to find rule name:

![rulenumber](https://github.com/WattageGuy/edgerouter-vpn-switch/blob/main/pictures/rulenumber.PNG?)


![rules](https://github.com/WattageGuy/edgerouter-vpn-switch/blob/main/pictures/rules.PNG)

# ssh key Mac and Edgerouter
1. In mac terminal: ssh-keygen -t rsa (You might need to input size for exampel -b 2048)
2. To save the key to mac type: ssh-add
3. ssh key saved in .ssh/id_rsa.pub give chmod 600.
4. To show ssh key in terminal: cat .ssh/id_rsa.pub (load this text into edgerouter) OBS! include ex "ssh-rsa" and "username@host.local".
Tutorial video: https://www.youtube.com/watch?v=E8-CfvumJBo

# Edgerouter ssh key
* Use loadkey to add key to edgrouter from a .pub file in edgrouters directory.
1. cd into .ssh
2. make a .pub file
3. paste your ssh key and write, quit (:w!, :q!) ESC to ensure no mispressed keys.
4. loadkey <path> (.pub file)
For more about edgerouter shh key: https://youtu.be/rpAOl8UgfXM
# Examples
[Homebridge](https://homebridge.io/) with plugin [Applescript](https://www.npmjs.com/package/homebridge-applescript) makes a switch in the HomeKit app to turn on/off the VPN easily. Use "do shell script '' open /path''" to run your .app
