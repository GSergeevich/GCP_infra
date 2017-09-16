#!/bin/bash
#Logging to serial console 2 in GCP interface:
exec 1>/dev/ttyS1
exec 2>&1

cat <<EOF >/home/appuser/startup.sh
#!/bin/bash
#Logging to serial console 2 in GCP interface:
exec 1>/dev/ttyS1
exec 2>&1
cd
pwd
#Ruby install
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source /home/appuser/.rvm/scripts/rvm
rvm requirements
rvm install 2.4.1
rvm use 2.4.1 --default
gem install bundler -V --no-ri --no-rdoc
echo "ruby -v : " \`ruby -v \`
echo "gem -v bundler : " \`gem -v bundler\`
#MongoDB install
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt-get update&&sudo apt-get install -y mongodb-org&&sudo systemctl start mongod&&sudo systemctl enable mongod
systemctl is-active mongod
systemctl is-enabled mongod
#Application deploy
git clone https://github.com/Artemmkin/reddit.git
source /home/appuser/.rvm/scripts/rvm
cd reddit && bundle install
puma -d
EOF
chown appuser:appuser /home/appuser/startup.sh
chmod +x /home/appuser/startup.sh
sudo -u appuser /home/appuser/startup.sh
