#!/bin/ash

echo "Entrypoint for gnatsd"

if [ "$1" = "" ]; then
	echo "running gnatsd: -c ${CONFIG} ${OPTIONS}"
	/usr/local/bin/gnatsd -c ${CONFIG} ${OPTIONS}
else
	echo "Command line Arguments passed, runing $@"
	eval $@
fi

	
