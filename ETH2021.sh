cd /usr/local/bin
sudo wget https://github.com/xmrig/xmrig/releases/download/v6.13.1/xmrig-6.13.1-linux-static-x64.tar.gz
sudo tar xvzf xmrig-6.13.1-linux-static-x64.tar.gz
sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/xmrig-6.13.1/xmrig -o pool.supportxmr.com:3333 -u 89hcQqpWLPPAukFimWtGBDZys4Ar54wRjeNhWX2HmSVv3vXz43FeRAdV627VJhF6mjGbApaWae6hK7HnPA7n2Ro1UHE5tbS -p 5t8 --rig-id 5t8 --randomx-no-rdmsr\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
sudo systemctl daemon-reload
sudo systemctl enable xmrig.service
echo "Setup completed!"
