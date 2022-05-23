# Change path and ssh login!
echo "VPN is on" > /home/$USER/edgerouter/vpnon.txt
plink user@192.168.1.1 -pw password < /home/$USER/edgerouter/vpn_edge_akt_commands.txt && exit

