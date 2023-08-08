set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./config;
mkdir -p ./src;
mkdir -p ./package;
mkdir -p ./yarn;
mkdir -p ./.env;
mkdir -p ./public/uploads;
mkdir -p ./strapi-data;

chmod 777 ./config
chmod 777 ./src
chmod 777 ./package
chmod 777 ./yarn
chmod 777 ./.env
chmod 777 ./public/uploads
chmod 777 ./strapi-data