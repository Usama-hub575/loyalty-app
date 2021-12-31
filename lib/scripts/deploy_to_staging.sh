#!/bin/zsh

flutter build web --release
echo "Deploying to Staging server"
cd ./web
aws s3 sync ./ s3://pg-as-staging-web/
