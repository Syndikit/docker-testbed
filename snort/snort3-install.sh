sudo apt-get install -y gcc libpcre3-dev zlib1g-dev libluajit-5.1-dev libpcap-dev openssl libssl-dev libnghttp2-dev libdumbnet-dev bison flex libdnet autoconf libtool 
sudo apt-get update -y && apt-get upgrade -y
sudo apt-get install make
mkdir ~/snort_src && cd ~/snort_src
wget https://www.snort.org/downloads/snortplus/libdaq-3.0.0.tar.gz
tar -xvzf libdaq-3.0.0.tar.gz
cd libdaq-3.0.0
autoreconf -f -i
./configure --disable-dependency-tracking && make && sudo make install
cd ~/snort_src
wget https://www.snort.org/downloads/snortplus/snort3-3.1.0.0.tar.gz
tar -xvzf snort3-3.1.0.0.tar.gz
cd snort3-3.1.0.0
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
#sudo cp ~/snort_src/snort3-3.1.0.0/etc/*.conf* /etc/snort
#sudo cp ~/snort_src/snort3-3.1.0.0/etc/*.map /etc/snort
sudo rm ../libdaq-3.0.0.tar.gz
sudo rm ../snort3-3.1.0.0.tar.gz