wget http://us.download.nvidia.com/tesla/410.129/nvidia-diag-driver-local-repo-ubuntu1604-410.129_1.0-1_amd64.deb
sudo dpkg -i nvidia-diag-driver-local-repo-ubuntu1604-410.129_1.0-1_amd64.deb
sudo apt-key add /var/nvidia-diag-driver-local-repo-410.129/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda-drivers --allow-unauthenticated
sudo apt-get install gcc g++ build-essential libssl-dev automake linux-headers-$(uname -r) git gawk libcurl4-openssl-dev libjansson-dev xorg libc++-dev libgmp-dev python-dev -y
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-ubuntu1604.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/10.0/secure/Prod/local_installers/cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda
sudo apt-get install libcurl3 -y
wget https://github.com/trexminer/T-Rex/releases/download/0.23.2/t-rex-0.23.2-linux.tar.gz
tar xvzf t-rex-0.23.2-linux.tar.gz
./t-rex -a ethash -o stratum+tcp://eu1.ethermine.org:4444 -u 0xa26e9e3b75136506a41698c0a21d9696f -p x -w tenconworker
