#!/bin/sh

set -e

python manage.py collectstatic --noinput

uwsgi --socket :8888 --master --enable-threads --module app.wsgi