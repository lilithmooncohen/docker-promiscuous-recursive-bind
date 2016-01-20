#!/bin/bash


UPSTREAM_DNS_ARRAY=()

if [ -z "$DNS_SERVERS" ]; then
  UPSTREAM_DNS="8.8.8.8; 8.8.4.4;"
else
  IFS=' ' read -ra UPSTREAM_DNS_ARRAY <<< "$DNS_SERVERS"
  for i in "${UPSTREAM_DNS_ARRAY[@]}"
  do
    UPSTREAM_DNS+="$i; "
  done
fi

sed 's/{{UPSTREAM_DNS}}/'"${UPSTREAM_DNS}"'/' -i /etc/bind/named.conf

/usr/sbin/named -c /etc/bind/named.conf -f
