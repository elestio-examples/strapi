<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Strapi, verified and packaged by Elestio

[Strapi](https://github.com/strapi/strapi-docker) is an open-source, fully customizable, and extensible JavaScript-based headless CMS.

<img src="https://github.com/elestio-examples/strapi/raw/main/strapi.jpg" alt="strapi" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/strapi">fully managed Strapi</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want to create JavaScript APIs that are quick and easy to manage.

[![deploy](https://github.com/elestio-examples/strapi/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/strapi)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/strapi.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Create data folders with correct permissions

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:9930`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: "3"
    services:
    strapi:
        image: elestio4test/strapi:${SOFTWARE_VERSION_TAG}
        restart: always
        env_file: .env
        environment:
            DATABASE_CLIENT: ${DATABASE_CLIENT}
            DATABASE_HOST: ${DATABASE_HOST}
            DATABASE_PORT: ${DATABASE_PORT}
            DATABASE_NAME: ${DATABASE_NAME}
            DATABASE_USERNAME: ${DATABASE_USERNAME}
            DATABASE_PASSWORD: ${DATABASE_PASSWORD}
            JWT_SECRET: ${JWT_SECRET}
            ADMIN_JWT_SECRET: ${ADMIN_JWT_SECRET}
            APP_KEYS: ${APP_KEYS}
            NODE_ENV: ${NODE_ENV}
        volumes:
            - ./config:/opt/app/config
            - ./src:/opt/app/src
            - ./package.json:/opt/package.json
            - ./yarn.lock:/opt/yarn.lock
            - ./.env:/opt/app/.env
            - ./public/uploads:/opt/app/public/uploads
        ports:
            - "172.17.0.1:9930:1337"
        depends_on:
            - strapiDB

    strapiDB:
        restart: always
        env_file: .env
        image: elestio/mysql:${SOFTWARE_VERSION_TAG}
        command: --default-authentication-plugin=mysql_native_password
        environment:
            MYSQL_USER: ${MYSQL_DATABASE_USERNAME}
            MYSQL_ROOT_PASSWORD: ${DATABASE_PASSWORD}
            MYSQL_PASSWORD: ${DATABASE_PASSWORD}
            MYSQL_DATABASE: ${DATABASE_NAME}
        volumes:
            - ./strapi-data:/var/lib/mysql
            #- ./data:/var/lib/mysql # if you want to use a bind folder
        ports: - "172.17.0.1:3306:3306"

### Environment variables

|       Variable       |    Value (example)    |
| :------------------: | :-------------------: |
|       TEST_URL       | http://localhost:9930 |
|     ADMIN_EMAIL      |    admin@gmail.com    |
|    ADMIN_PASSWORD    |     your-password     |
| SOFTWARE_VERSION_TAG |        latest         |
|    DATABASE_NAME     |     your-db-name      |
|    DATABASE_HOST     |       your-host       |
|  DATABASE_USERNAME   |   your-db-username    |
|  DATABASE_PASSWORD   |   your-db-password    |
|      JWT_SECRET      |      jwt-secret       |
|   ADMIN_JWT_SECRET   |   admin-jwt-secret    |
|       APP_KEYS       |       app-keys        |
|       NODE_ENV       |      production       |

# Maintenance

## Logging

The Elestio Strapi Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://github.com/strapi/strapi-docker">Strapi Github repository</a>

- <a target="_blank" href="https://docs.strapi.io/">Strapi documentation</a>

- <a target="_blank" href="https://github.com/elestio-examples/strapi">Elestio/Strapi Github repository</a>
