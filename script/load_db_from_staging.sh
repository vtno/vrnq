#!/bin/bash

heroku pg:backups capture --app veronique-tool
curl -o latest.dump `heroku pg:backups public-url --app veronique-tool`
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $(whoami) -d vrnq_development latest.dump
