#!/bin/sh




if [ ! -z "$AUTHTOKEN" ]; then

#ngrok authtoken $AUTHTOKEN > /dev/null 2>&1





if [ ! -z "$PROTOCOL" ]; then

if [ ! -z "HOST" ]; then
if [ ! -z "$SUBDOMAIN" ] || [ ! -z "$REMOTE_ADDR" ]; then


if [ -z "$REGION" ]; then
REGION="us"
fi




/etc/init.d/nginx force-reload
/etc/init.d/nginx start


if [ ! -z "$SUBDOMAIN" ]; then
ngrok $PROTOCOL --authtoken $AUTHTOKEN --region $REGION -subdomain $SUBDOMAIN $HOST > /dev/null 2>&1
else
ngrok $PROTOCOL --authtoken $AUTHTOKEN --region $REGION --remote-addr $REMOTE_ADDR $HOST > /dev/null 2>&1
fi



else
	echo >&2 'error: missing required SUBDOMAIN or REMOTE_ADDR environment variable'
	echo >&2 '  Did you forget to -e SUBDOMAIN=... or -e REMOTE_ADDR=... ?'
	exit 1
fi
else
	echo >&2 'error: missing required HOST environment variable'
	echo >&2 '  Did you forget to -e HOST=... ?'
	exit 1
fi

else
	echo >&2 'error: missing required PROTOCOL environment variable'
	echo >&2 '  Did you forget to -e PROTOCOL=... ?'
	exit 1
fi





else
	echo >&2 'error: missing required AUTHTOKEN environment variable'
	echo >&2 '  Did you forget to -e AUTHTOKEN=... ?'
	exit 1
fi









exit 0







