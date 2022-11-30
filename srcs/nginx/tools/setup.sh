#!/bin/sh

sleep 3

echo "
nginx start
";

exec nginx -g 'daemon off;'