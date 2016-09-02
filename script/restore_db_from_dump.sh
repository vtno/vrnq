pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $(whoami) -d vrnq_development latest.dump
