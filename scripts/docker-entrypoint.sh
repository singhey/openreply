#!/bin/sh
# Runs migrations against the DB (only reachable now, at container start —
# not at build time, see Dockerfile), starts the worker alongside the web
# process, and keeps the container alive on the web process.
set -e

npx prisma migrate deploy

npm run worker &

exec npm run start
