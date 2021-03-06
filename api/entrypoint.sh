#!/bin/bash

while ! pg_isready -q -h $PGHOST -p $PGPORT -U $PGUSER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

mix ecto.migrate

if [[ -z `psql -Atqc "\\list api_dev"` ]]; then
  echo "Database does not exist. Creating..."
  createdb -E UTF8 api_dev -l en_US.UTF-8 -T template0
  mix run priv/repo/seeds.exs
  mix ecto.migrate
  echo "Database api_dev created."
fi

exec mix phx.server