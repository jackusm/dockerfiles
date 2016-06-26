#!/bin/sh
set -e
chown -R bitlbee:bitlbee /var/lib/bitlbee
exec $@