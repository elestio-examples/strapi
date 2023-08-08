#!/usr/bin/env bash
cp -rf strapi/* ./
sed -i "s~ARG BASE_VERSION~ARG BASE_VERSION=latest~g" Dockerfile
sed -i "s~ARG STRAPI_VERSION~ARG STRAPI_VERSION=latest~g" Dockerfile
docker buildx build . --output type=docker,name=elestio4test/strapi:latest | docker load
