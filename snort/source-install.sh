sudo apt-get install -y gcc libpcre3-dev zlib1g-dev libluajit-5.1-dev libpcap-dev openssl libssl-dev libnghttp2-dev libdumbnet-dev bison flex libdnet autoconf libtool 
sudo apt-get update -y && apt-get upgrade -y
sudo apt-get install make
mkdir ~/snort_src && cd ~/snort_src
wget https://www.snort.org/downloads/snort/daq-2.0.7.tar.gz
tar -xvzf daq-2.0.7.tar.gz
cd daq-2.0.7
autoreconf -f -i
./configure --disable-dependency-tracking && make && sudo make install
cd ~/snort_src
wget https://www.snort.org/downloads/snort/snort-2.9.17.tar.gz
tar -xvzf snort-2.9.17.tar.gz
cd snort-2.9.17
sudo ln -s /usr/local/bin/snort /usr/sbin/snort
sudo groupadd snort
sudo useradd snort -r -s /sbin/nologin -c SNORT_IDS -g snort
sudo mkdir -p /etc/snort/rules
sudo mkdir /var/log/snort
sudo mkdir /usr/local/lib/snort_dynamicrules
sudo chmod -R 5775 /etc/snort
sudo chmod -R 5775 /var/log/snort
sudo chmod -R 5775 /usr/local/lib/snort_dynamicrules
sudo chown -R snort:snort /etc/snort
sudo chown -R snort:snort /var/log/snort
sudo chown -R snort:snort /usr/local/lib/snort_dynamicrules
sudo touch /etc/snort/rules/white_list.rules
sudo touch /etc/snort/rules/black_list.rules
sudo touch /etc/snort/rules/local.rules
sudo cp ~/snort_src/snort-2.9.17/etc/*.conf* /etc/snort
sudo cp ~/snort_src/snort-2.9.17/etc/*.map /etc/snort
sudo rm ../daq-2.0.7.tar.gz
sudo rm ../snort-2.9.17.tar.gz