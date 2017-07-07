#!/bin/bash

# Add correct values here
# Proxy address (or name)
PROXY_ADDR=proxypod.openshift.dev
PROXY_PORT=8080
PROXY_USER=username
PROXY_PASS=proxypass

# Target URL for test
TEST_URL=http://www.google.com

# Sleep timer (between tests)
SLEEP_SEC=20

export http_proxy=http://$PROXY_USER:$PROXY_PASS@$PROXY_ADDR:$PROXY_PORT

echo -e "------------------------------------------------\nProxy Test Script - $(date)\n------------------------------------------------"
while true; do
	echo "Connecting to $TEST_URL via $http_proxy..."
	curl -s $TEST_URL 
	RET=$?
	if [ $RET -eq 0 ]; then
                echo "---"
		echo "- Proxy connect succeeded"
	else
	  	echo "- Proxy connect failed"
	fi
	echo "Sleeping $SLEEP_SEC seconds..."
	sleep $SLEEP_SEC
done
	
