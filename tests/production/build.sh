yes | npx create-strapi-app@latest app --dbforce --no-run --dbclient=postgres --dbhost=db --dbport=5432 --dbname=strapi --dbusername=postgres --dbpassword=postgres

cp ./.dockerignore ./app/.dockerignore
cp ./Dockerfile ./app/Dockerfile
cp ./.env ./app/.env
cp ./entrypoint.sh ./app/entrypoint.sh

pwd=$(pwd)
IFS="/"
read -ra parts <<< "$pwd"
folderName="${parts[-1]}"

cat << EOT >> ./.env

folderName=$folderName
EOT


cd ./app && docker buildx build . --output type=docker,name=elestio4test/strapi-development:latest | docker load