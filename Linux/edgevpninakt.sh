# Change path and ssh login!
rm /home/$USER/edgerouter/vpnon.txt
plink user@192.168.1.1 -pw password < /home/$USER/edgerouter/vpn_edge_inakt_commands.txt && pkill -9 edgevpninakt.sh

