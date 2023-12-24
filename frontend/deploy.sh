#! /bin/bash
set -xe
sudo cp -rf ./frontend.service /etc/systemd/system/frontend.service
CURL_URL="$NEXUS_REPO_URL/$NEXUS_REPO_FRONTEND_NAME/$VERSION/sausage-store-$VERSION.tar.gz"
curl -u $NEXUS_REPO_USER:$NEXUS_REPO_PASS -o sausage-store.tar.gz $CURL_URL
PATH="/home/frontend/sausage-store/static/dist"
sudo cp ./sausage-store.tar.gz $PATH||true
sudo tar xzvf $PATH/sausage-store.tar.gz
sudo systemctl daemon-reload
sudo systemctl restart frontend.service
