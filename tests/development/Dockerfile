FROM node:18
RUN apt-get update && apt-get install libvips-dev -y
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
USER strapi
RUN mkdir -p /opt && \
    chown -R strapi:strapi /opt
WORKDIR /opt/
COPY ./package.json ./
ENV PATH /opt/node_modules/.bin:$PATH
RUN yarn config set network-timeout 600000 -g && yarn install
USER strapi
RUN mkdir -p /opt/app && \
    chown -R strapi:strapi /opt/app
WORKDIR /opt/app
COPY ./ .
RUN yarn build
EXPOSE 1337
CMD ./entrypoint.sh && yarn develop