#!/bin/bash
sed -i.bak -e "s%^proxy_app = \"tcp://127.0.0.1:26658\"%proxy_app = \"tcp://127.0.0.1:36658\"%; s%^laddr = \"tcp://127.0.0.1:26657\"%laddr = \"tcp://127.0.0.1:36657\"%; s%^pprof_laddr = \"localhost:6060\"%pprof_laddr = \"localhost:6061\"%; s%^laddr = \"tcp://0.0.0.0:26656\"%laddr = \"tcp://0.0.0.0:36656\"%; s%^prometheus_listen_addr = \":26660\"%prometheus_listen_addr = \":36660\"%" $HOME/.artelad/config/config.toml
sed -i.bak -e "s%^address = \"localhost:9090\"%address = \"localhost:9190\"%; s%^address = \"localhost:9091\"%address = \"localhost:9191\"%; s%^address = \"tcp://localhost:1317\"%address = \"tcp://localhost:1327\"%" $HOME/.artelad/config/app.toml
sed -i.bak -e "s%^node = \"tcp://localhost:26657\"%node = \"tcp://localhost:36657\"%" $HOME/.artelad/config/client.toml
sudo systemctl restart artelad
echo -e '\e[40m\e[91m'
echo -e ' 26656-->36656 '
echo -e ' 26657-->36657 '
echo -e ' 26658-->36658 '
echo -e ' 6060 --> 6061 '
echo -e ' 26660-->36660 '
echo -e ' 9090 --> 9190 '
echo -e ' 9091 --> 9191 '
echo -e ' 1317 --> 1327 '
echo -e '\e[0m'
