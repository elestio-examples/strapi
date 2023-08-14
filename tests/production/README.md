<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Strapi, verified and packaged by Elestio

[Strapi](https://github.com/strapi/strapi-docker) is an open-source, fully customizable, and extensible JavaScript-based headless CMS.

<img src="https://github.com/elestio-examples/strapi/raw/main/strapi.png" alt="strapi" width="800">

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

Install your plugins with `yarn` command on `entrypoint.sh` file.

Create data folders with correct permissions

Run the project with the following command

    ./scripts/preInstall.sh
    docker-compose up -d
    ./script/postInstall.sh

You can access the Web UI at: `http://your-domain:9930`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: "3"
    services:
        strapi:
            image: elestio4test/strapi-${NODE_ENV}:latest
            restart: always
            env_file: .env
            environment:
            DATABASE_CLIENT: ${DATABASE_CLIENT}
            DATABASE_HOST: db
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
            # - ./package.json:/opt/package.json
            # - ./yarn.lock:/opt/yarn.lock
            - ./.env:/opt/app/.env
            - ./public/uploads:/opt/app/public/uploads
            - ./entrypoint.sh:/opt/app/entrypoint.sh
            ports:
            - "172.17.0.1:9930:1337"
            depends_on:
            - db

        db:
            image: elestio/postgres:latest
            restart: always
            environment:
            POSTGRES_DB: ${DATABASE_NAME}
            POSTGRES_USER: ${DATABASE_USERNAME}
            POSTGRES_PASSWORD: ${DATABASE_PASSWORD}
            PGDATA: /var/lib/postgresql/data
            volumes:
            - ./pgdata:/var/lib/postgresql/data
            ports:
            - "172.17.0.1:24538:5432"

### Environment variables

|      Variable       |   Value (example)   |
| :-----------------: | :-----------------: |
|   ADMIN_PASSWORD    |    your-password    |
|     ADMIN_EMAIL     |   your@email.com    |
|      BASE_URL       | https://your.domain |
|      SMTP_HOST      |     172.17.0.1      |
|      SMTP_PORT      |         25          |
| SMTP_AUTH_STRATEGY  |        NONE         |
|   SMTP_FROM_EMAIL   |  sender@email.com   |
|   DATABASE_CLIENT   |      postgres       |
|    DATABASE_PORT    |        5432         |
|    DATABASE_NAME    |       strapi        |
|  DATABASE_USERNAME  |      postgres       |
|  DATABASE_PASSWORD  |    your-password    |
|     JWT_SECRET      |    your-password    |
|  ADMIN_JWT_SECRET   |    your-password    |
|      APP_KEYS       |    your-password    |
|      NODE_ENV       |     production      |
|    DATABASE_HOST    |         db          |
|   API_TOKEN_SALT    |    your-password    |
| TRANSFER_TOKEN_SALT |    your-password    |

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
