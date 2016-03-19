#!/bin/bash

conf_server=https://shielded-lake-22447.herokuapp.com/conf/
conf_file=$HOME/bin/vpn/local_peer.conf

cd $HOME/bin/vpn

# if [ ! -f "$conf_file" ]; then
  echo "Downloading conf"
  wget -q $conf_server -O $conf_file

# fi

echo "sudo $HOME/bin/vpn/peervpn $conf_file" > $HOME/bin/run_vpn
chmod +x $HOME/bin/run_vpn

sudo systemctl enable peervpn
sudo systemctl restart peervpn