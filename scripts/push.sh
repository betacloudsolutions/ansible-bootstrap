#!/bin/sh

USERNAME=betacloud-ansible
PASSWORD=hie0Wof2the0uGeu

NAME=betacloud.bootstrap
TAG=$(date +%Y%m%d)
ARCHIVE=$NAME-$TAG.tar.gz

LAST_TAG=$(git describe --abbrev=0 --tags)
if [[ $(git diff master..$LAST_TAG) ]]; then
    git tag $TAG
    git push --tags
    tar cvzf $ARCHIVE README.md defaults files handlers meta tasks templates
    mkdir $NAME
    tar xvzf $ARCHIVE -C $NAME
    tar cvzf $ARCHIVE $NAME
    curl -v --user "$USERNAME:$PASSWORD" --upload-file $ARCHIVE https://nexus.betacloud.io/repository/ansible/$ARCHIVE
    rm -f $ARCHIVE
    rm -rf $NAME
else
    echo "no change since latest tag $LAST_TAG"
fi
