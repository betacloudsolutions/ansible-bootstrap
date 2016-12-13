#!/bin/sh

# Available environment variables:
#
# NEXUS_ARTIFACT_NAME
# NEXUS_ARTIFACT_TAG
# NEXUS_USERNAME
# NEXUS_PASSWORD
# NEXUS_SERVER

ARCHIVE=$NEXUS_ARTIFACT_NAME-$NEXUS_ARTIFACT_TAG.tar.gz

tar cvzf $ARCHIVE README.md defaults files handlers meta tasks templates
mkdir $NEXUS_ARTIFACT_NAME
tar xvzf $ARCHIVE -C $NEXUS_ARTIFACT_NAME
tar cvzf $ARCHIVE $NEXUS_ARTIFACT_NAME
curl -v --user "$NEXUS_USERNAME:$NEXUS_PASSWORD" --upload-file $ARCHIVE https://$NEXUS_SERVER/repository/ansible/$ARCHIVE
rm -f $ARCHIVE
rm -rf $NEXUS_ARTIFACT_NAME
