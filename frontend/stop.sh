set -xe
sudo systemctl stop frontend.service
sudo rm -rf /etc/systemd/system/fontend.service
sudo rm -rf /home/frontend/sausage-store/static/dist/frontend/*
