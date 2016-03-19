#!/bin/bash

vpn_tar=peervpn.tar.gz

install_vpn()
{
  echo "Install vpn"

  wget -q https://peervpn.net/files/peervpn-0-043-linux-x86.tar.gz -O $vpn_tar

  tar xf $vpn_tar
  mv peervpn*/* vpn/
}

sudo apt-get install -y curl tmux htop

mkdir -p bin/vpn
cd bin

if [ ! -f "$vpn_tar" ]; then
  install_vpn
fi


# Install first fun
cp /vagrant/first_run.sh $HOME/bin/
cp /vagrant/vpn_init.sh $HOME/bin/

## Install Services
sudo cp /vagrant/conf/services/*.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable runonce
