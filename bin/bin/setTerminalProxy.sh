#!/bin/bash
if [[ $HTTP_PROXY != "" ]] || [[ $HTTPS_PROXY != "" ]]; then
    export HTTP_PROXY=""
    export HTTPS_PROXY=""
    echo -e "HTTP_PROXY=$HTTP_PROXY \nHTTPS_PROXY=$HTTPS_PROXY"
else
    export HTTP_PROXY=socks5://127.0.0.1:7890
    export HTTPS_PROXY=socks5://127.0.0.1:7890
    echo -e "HTTP_PROXY=$HTTP_PROXY \nHTTPS_PROXY=$HTTPS_PROXY"
fi

