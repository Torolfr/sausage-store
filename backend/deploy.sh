#! /bin/bash
set -xe
sudo cp -rf ./backend.service /etc/systemd/system/backend.service
CURL_URL=${NEXUS_REPO_URL}/${NEXUS_REPO_BACKEND_NAME}/com/yandex/practicum/devops/sausage-store/${VERSION}/sausage-store-${VERSION}.jar
curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store.jar ${CURL_URL}
sudo cp ./sausage-store.jar /opt/sausage-store/bin/sausage-store.jar||true
sudo systemctl daemon-reload
sudo systemctl restart backend.service
