#set env vars
#set -o allexport; source .env; set +o allexport;

if [ -e "./entrypoint.sh" ]; then
   exit 0;
fi

cat <<EOT > entrypoint.sh
yarn add @strapi/provider-email-nodemailer

EOT

chmod +x ./entrypoint.sh

cat <<EOT > ./servers.json
{
    "Servers": {
        "1": {
            "Name": "local",
            "Group": "Servers",
            "Host": "db",
            "Port": 5432,
            "MaintenanceDB": "postgres",
            "SSLMode": "prefer",
            "Username": "postgres",
            "PassFile": "/pgpass"
        }
    }
}
EOT
