#!/bin/bash

SCRIPTS_DIR=`dirname $0`

SETTINGS_NAME=katacoda

. $SCRIPTS_DIR/setup-environment.sh

# Login as developer rather than system:admin.

echo "### Deploying workshop using Homeroom."

SERVER_ADDRESS=`oc get --raw /.well-known/oauth-authorization-server | grep '"issuer":' | sed -e 's%.*https://%%' -e 's%",%%'`
CLUSTER_SUBDOMAIN=`echo $SERVER_ADDRESS | sed -e 's/-443-/-80-/' -e 's/:.*//' -e 's/oauth-openshift-//'`

oc login -u admin -p admin > /dev/null

oc new-project workshop > /dev/null

cat >> $WORKSHOP_DIR/katacoda-settings.sh << EOF
WORKSHOP_NAME=workshop
DASHBOARD_MODE=cluster-admin
OPENSHIFT_PROJECT=homeroom
CLUSTER_SUBDOMAIN=$CLUSTER_SUBDOMAIN
AUTH_USERNAME=*
AUTH_PASSWORD=
EOF

$SCRIPTS_DIR/deploy-personal.sh --settings=katacoda

echo "### Creating route for Homeroom access."

oc expose svc/workshop --name homeroom

echo "### Homeroom Ready."
