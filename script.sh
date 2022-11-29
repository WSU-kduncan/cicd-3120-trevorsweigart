#!/bin/sh
docker pull trevorsweigart/ceg3120
docker image prune -f
docker stop web
docker rm web
docker run -p 80:80 -d --name web trevorsweigart/ceg3120
