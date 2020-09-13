#!/bin/bash
BASE_DIR="$(cd "$(dirname "$0" )" && pwd )"
BASE_TAG=$(date +%F | sed 's/-0/-/g' | sed 's/-/\./g')
DATESTAMP=$(date +%F | sed 's/-/ /g')
VERSION="0"

cd $BASE_DIR
while git tag | grep $BASE_TAG.$VERSION > /dev/null;
do
    VERSION=$[$VERSION+1]
done

COMMIT_MSG="Resume $DATESTAMP version $VERSION"
TAG_MSG="$(date +%Y) $(date +%B) $(date +%d | sed 's/^0*//g') v$VERSION"

git add $BASE_DIR/index.html
git add $BASE_DIR/static/styles.css
git commit -m "$COMMIT_MSG"
if [ $? -ne 0 ];
then
    echo "Failed to commit - aborting."
    exit 1
fi
git tag -a $BASE_TAG.$VERSION -m "$TAG_MSG"
git push
git push --tags
