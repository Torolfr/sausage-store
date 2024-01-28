set -xe
sudo systemctl stop backend.service
sudo rm -rf /etc/systemd/system/backend.service
sudo rm -rf /opt/sausage-store/bin/sausage-store.jar
