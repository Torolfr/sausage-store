#! /bin/bash
set -xe
sudo docker login -u ${CI_REGISTRY_USER} -p${CI_REGISTRY_PASSWORD} ${CI_REGISTRY}
echo ${CI_REGISTRY_IMAGE}
echo ${CI_REGISTRY}
sudo docker network create -d bridge sausage_network || true
sudo docker rm -f sausage-backend || true
sudo docker rmi gitlab.praktikum-services.ru:5050/std-024-29/sausage-store/sausage-backend || true
sudo docker run -d --name sausage-backend \
     --env SPRING_DATASOURCE_URL="${SPRING_DATASOURCE_URL}" \
     --env SPRING_DATASOURCE_USERNAME="${SPRING_DATASOURCE_USERNAME}" \
     --env SPRING_DATASOURCE_PASSWORD="${SPRING_DATASOURCE_PASSWORD}" \
     --env SPRING_DATA_MONGODB_URI="${SPRING_DATA_MONGODB_URI}" \
     --network=sausage_network \
     --restart=always \
     "${CI_REGISTRY_IMAGE}"/sausage-backend:latest