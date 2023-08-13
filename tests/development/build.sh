yes | npx create-strapi-app@latest my-project --dbforce --no-run --dbclient=postgres --dbhost=db --dbport=5432 --dbname=strapi --dbusername=postgres --dbpassword=postgres


cd ./my-project && docker buildx build . --output type=docker,name=elestio4test/strapi-development:latest | docker load