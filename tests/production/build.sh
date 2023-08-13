yes | npx create-strapi-app@latest app --dbforce --no-run --dbclient=postgres --dbhost=db --dbport=5432 --dbname=strapi --dbusername=postgres --dbpassword=postgres

cp ./.dockerignore ./app/.dockerignore
cp ./Dockerfile ./app/Dockerfile
cp ./.env ./app/.env
cp ./entrypoint.sh ./app/entrypoint.sh

pwd=$(pwd)
IFS="/"
read -ra parts <<< "$pwd"
folderName="${parts[-1]}"

sed -i 's~PATH_TO_CHANGE~/opt/app/oss/temp/'"${folderName}"'~g' /opt/app/oss/temp/${folderName}/docker-compose.yml


cd ./app && docker buildx build . --output type=docker,name=elestio4test/strapi-development:latest | docker load