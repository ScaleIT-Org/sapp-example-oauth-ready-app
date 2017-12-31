#!/bin/sh
set -e

# Disabling nginx daemon mode
export KONG_NGINX_DAEMON="off"

# Setting default prefix (override any existing variable)
export KONG_PREFIX="/usr/local/kong"

# Prepare Kong prefix
if [ "$1" = "/usr/local/openresty/nginx/sbin/nginx" ]; then
	kong prepare -p "/usr/local/kong"
fi

echo "Preparing database..."
migrate=$(kong migrations up)
if [[ -z "${migrate// }" ]]; then
    echo "No migrations necessary"
else
    echo $migrate
    echo "Database preparation finished"
fi

# TODO File not recognized
if [ -f /config/kong-apis.json ]; then
    echo "APIs config file detected, applying"

    for row in $(jq -c '.[]' /config/kong-apis.json); do
        # skip empty rows
        if [[ -z "${row// }" ]]; then
            continue
        fi

        name=$(echo $row | jq -r '.name')
        # check if API with name already exists otherwise update it
        res=$(curl -s -o /dev/null -w '%{http_code}\n' localhost:8001/apis/${name})
        if [ $res == 404 ]; then
            echo "Adding API ${name}:"
            curl -s -d ${row} -H "Content-Type: application/json" -X POST http://localhost:8001/apis | jq .
        else
            echo "Updating API ${name}:"
            curl -s -d ${row} -H "Content-Type: application/json" -X PATCH http://localhost:8001/apis/${name} | jq .
        fi

    done
fi

exec "$@"