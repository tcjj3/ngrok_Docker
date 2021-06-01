#!/bin/sh




if [ ! -z "$AUTHTOKEN" ]; then

ngrok authtoken $AUTHTOKEN > /dev/null 2>&1




if [ ! -z "$PROTOCOL" ]; then

if [ ! -z "HOST" ]; then
if [ ! -z "$SUBDOMAIN" ]; then
ngrok $PROTOCOL -subdomain $SUBDOMAIN $HOST > /dev/null 2>&1
else
	echo >&2 'error: missing required SUBDOMAIN environment variable'
	echo >&2 '  Did you forget to -e SUBDOMAIN=... ?'
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







