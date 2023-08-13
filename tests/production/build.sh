yes | npx create-strapi-app@latest my-project --dbforce --no-run --dbclient=postgres --dbhost=db --dbport=5432 --dbname=strapi --dbusername=postgres --dbpassword=postgres

cp ./.dockerignore ./my-project/.dockerignore
cp ./.env ./my-project/.env
cp ./build.sh ./my-project/build.sh
cp ./docker-compose.yml ./my-project/docker-compose.yml
cp ./Dockerfile ./my-project/Dockerfile
cp ./entrypoint.sh ./my-project/entrypoint.sh
cp ./README.md ./my-project/README.md
cd ./run.sh ./my-project/run.sh

folder_path=$(pwd)
excluded_subfolder="my-project"

# Check if the folder exists
if [ -d "$folder_path" ]; then
    # Use find to list all files in the folder except the excluded subfolder
    files_to_remove=$(find "$folder_path"/* -maxdepth 0 ! -name "$excluded_subfolder")
    
    # Remove the files
    rm -f $files_to_remove
fi

cp ./my-project* ./

docker buildx build . --output type=docker,name=elestio4test/strapi-production:latest | docker load