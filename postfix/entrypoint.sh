#!/bin/bash

echo $#
echo $0
echo $1
if [ $# -gt 1 -a "$1" = "/usr/bin/supervisord" ]; then
    echo "run postconf"
    postconf -e mydomain=$mydomain
    echo $?
    postconf -e "mydestination = localhost, localhost.$mydomain, $myhostname, $mydomain"
    postconf -e 'smtpd_sasl_type = dovecot'
    postconf -e 'smtpd_sasl_auth_enable = yes'
    postconf -e 'smtpd_recipient_restrictions = permit_sasl_authenticated,permit_mynetworks,reject_unauth_destination'
    postconf -e 'smtpd_sasl_path = private/auth'
    postconf -e message_size_limit=52428800
fi

exec "$@"
