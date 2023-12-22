#! /bin/bash
set -xe
curl -u $NEXUS_REPO_USER:$NEXUS_REPO_PASS -o sausage-store-$VERSION.jar $NEXUS_REPO_URL/$NEXUS_REPO_BACKEND_NAME/com/yandex/practicum/devops/sausage-store/$VERSION/sausage-store-$VERSION.jar
