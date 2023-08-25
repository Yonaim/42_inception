#!/bin/bash

set -e

host="$1"
shift
cmd="$@"

until mysql -h "$host" -u "$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" -e 'SELECT 1'; do
  >&2 echo "Database is unavailable - sleeping"
  sleep 1
done

>&2 echo "Database is up - executing command"
exec $cmd
