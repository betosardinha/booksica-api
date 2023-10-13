#!/bin/bash
set -e

rm -f /booksica-api/tmp/pids/server.pid

exec "$@"