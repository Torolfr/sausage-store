#! /bin/bash
set -xe
sudo cp -rf ./frontend.service /etc/systemd/system/frontend.service
CURL_URL="$NEXUS_REPO_URL/$NEXUS_REPO_FRONTEND_NAME/$VERSION/sausage-store-$VERSION.tar.gz"
curl -u $NEXUS_REPO_USER:$NEXUS_REPO_PASS -o sausage-store-$VERSION.tar.gz $CURL_URL
sudo cp ./sausage-store-$VERSION.tar.gz /home/frontend/sausage-store/static/dist||true
sudo tar xzvf sausage-store-$VERSION.tar.gz
sudo systemctl daemon-reload
sudo systemctl restart backend.service
