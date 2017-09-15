#!/bin/bash
cat <<EOF >/home/appuser/startup.sh
#!/bin/bash
cd
pwd
git clone https://github.com/Artemmkin/reddit.git
source ~/.rvm/scripts/rvm
cd reddit && bundle install
puma -d
EOF
chown appuser:appuser /home/appuser/startup.sh
chmod +x /home/appuser/startup.sh
sudo -u appuser /home/appuser/startup.sh
