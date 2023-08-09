# Strapi CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/strapi"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Strapi with CI/CD on Elestio

<img src="strapi.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open Strapi UI here:

    URL: https://[CI_CD_DOMAIN]/admin
    email: [ADMIN_EMAIL]
    password: [ADMIN_PASSWORD]

You can open pgAdmin web UI here:

    URL: https://[CI_CD_DOMAIN]:8443
    email: [ADMIN_EMAIL]
    password: [ADMIN_PASSWORD]

# Plugins

You can install your plugins by adding `yarn command` in the `entrypoint.sh` file.
