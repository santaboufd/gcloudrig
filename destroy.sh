#!/usr/bin/env bash

# exit on error
set -e

# full path to script dir
DIR="$( cd "$( dirname -- "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# load globals
# shellcheck source=globals.sh
source "$DIR/globals.sh"
init_globals;

# shut it down
gcloudrig_stop || echo -n

# delete managed instance group
gcloud compute instance-groups managed delete "$INSTANCEGROUP" --region "$REGION" --quiet || echo -n

# delete instance templates
gcloud compute instance-templates delete "$INSTANCETEMPLATE-base" --quiet || echo -n
gcloud compute instance-templates delete "$INSTANCETEMPLATE" --quiet || echo -n