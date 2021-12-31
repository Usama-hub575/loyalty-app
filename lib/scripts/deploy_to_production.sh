#!/bin/zsh

flutter build web --release
echo "Deploying to production server"
cd ./web
aws s3 sync ./ s3://pg-as-web/
