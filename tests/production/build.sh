yes | npx create-strapi-app@latest app --dbforce --no-run --dbclient=postgres --dbhost=db --dbport=5432 --dbname=strapi --dbusername=postgres --dbpassword=postgres

cp ./.dockerignore ./app/.dockerignore
cp ./Dockerfile ./app/Dockerfile


cd ./app && docker buildx build . --output type=docker,name=elestio4test/strapi-production:latest | docker load