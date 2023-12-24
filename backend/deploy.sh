#! /bin/bash
set -xe
sudo cp -rf ./backend.service /etc/systemd/system/backend.service
curl -u $NEXUS_REPO_USER:$NEXUS_REPO_PASS -o sausage-store.jar $NEXUS_REPO_URL/$NEXUS_REPO_BACKEND_NAME/com/yandex/practicum/devops/sausage-store/$VERSION/sausage-store-$VERSION.jar
sudo cp ./sausage-store.jar /opt/sausage-store/bin/sausage-store.jar||true
sudo systemctl daemon-reload
sudo systemctl restart backend.service
