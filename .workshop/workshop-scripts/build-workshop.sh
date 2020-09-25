#!/bin/bash

SCRIPTS_DIR=`dirname $0`

. $SCRIPTS_DIR/parse-arguments.sh

. $SCRIPTS_DIR/setup-environment.sh

echo "### Checking if already have a build configuration."

oc get bc "$NAME_PREFIX$WORKSHOP_NAME" -o name 2>/dev/null

if [ "$?" != "0" ]; then
    echo "..."

    echo "### Creating build configuration for workshop."

    oc new-build --binary --name "$NAME_PREFIX$WORKSHOP_NAME"

    if [ "$?" != "0" ]; then
        fail "Failed to create build configuration."
        exit 1
    fi
fi

echo "### Building workshop from local content."

oc start-build "$NAME_PREFIX$WORKSHOP_NAME" --from-dir . --follow

if [ "$?" != "0" ]; then
    fail "Failed to build workshop content."
    exit 1
fi

echo "### Updating tags for workshop images."

oc get is "$NAME_PREFIX$WORKSHOP_NAME-session" -o name 2>/dev/null

if [ "$?" == "0" ]; then
    oc tag "$NAME_PREFIX$WORKSHOP_NAME:latest" "$NAME_PREFIX$WORKSHOP_NAME-session:latest"
fi
