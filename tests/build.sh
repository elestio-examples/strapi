#!/usr/bin/env bash
cp -rf strapi/* ./
docker buildx build . --output type=docker,name=elestio4test/strapi:latest | docker load
