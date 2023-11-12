#!/bin/sh
set -e
rm -f /home/app/tmp/pids/server.pid
RAILS_ENV=production rails db:migrate && rails db:seed || true
exec "$@"
