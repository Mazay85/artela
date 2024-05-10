#!/bin/bash

while true
do

# Logo

echo -e '\e[40m\e[91m'
echo -e '  ____                  _                    '
echo -e ' / ___|_ __ _   _ _ __ | |_ ___  _ __        '
echo -e '| |   |  __| | | |  _ \| __/ _ \|  _ \       '
echo -e '| |___| |  | |_| | |_) | || (_) | | | |      '
echo -e ' \____|_|   \__  |  __/ \__\___/|_| |_|      '
echo -e '            |___/|_|                         '
echo -e '\e[0m'

sleep 2

# Menu

PS3='Select an action: '
options=(
"Change 26656-->36656"
"Change 26656-->46656"
"Change 26656-->56656"
"Exit")
select opt in "${options[@]}"
do
case $opt in

"Change 26656-->36656")
sed -i.bak -e "s%^proxy_app = \"tcp://127.0.0.1:26658\"%proxy_app = \"tcp://127.0.0.1:36658\"%; s%^laddr = \"tcp://127.0.0.1:26657\"%laddr = \"tcp://127.0.0.1:36657\"%; s%^pprof_laddr = \"localhost:6060\"%pprof_laddr = \"localhost:6061\"%; s%^laddr = \"tcp://0.0.0.0:26656\"%laddr = \"tcp://0.0.0.0:36656\"%; s%^prometheus_listen_addr = \":26660\"%prometheus_listen_addr = \":36660\"%" $HOME/.artelad/config/config.toml
sed -i.bak -e "s%^address = \"localhost:9090\"%address = \"localhost:9190\"%; s%^address = \"localhost:9091\"%address = \"localhost:9191\"%; s%^address = \"tcp://localhost:1317\"%address = \"tcp://localhost:1327\"%" $HOME/.artelad/config/app.toml
sed -i.bak -e "s%^node = \"tcp://localhost:26657\"%node = \"tcp://localhost:36657\"%" $HOME/.artelad/config/client.toml
sed -i.bak -e "s/^external_address *=.*/external_address = \"external_address:36656\"/" $HOME/.artelad/config/config.toml
sudo systemctl restart artelad

echo -e ' 26656-->36656
echo -e ' 26657-->36657
echo -e ' 26658-->36658
echo -e ' 6060 --> 6061
echo -e ' 26660-->36660
echo -e ' 9090 --> 9190
echo -e ' 9091 --> 9191
echo -e ' 1317 --> 1327


break
;;

"Change 26656-->46656")


break
;;

"Change 26656-->56656")

  
break
;;

"Exit")
exit
;;
*) echo "invalid option $REPLY";;
esac
done
done
