#!/bin/bash
set +e +x

TARGET=$PWD/resources/azurefilebroker.zip

rm -f $TARGET
rm -fr smb-volume-release

git clone https://github.com/cloudfoundry/smb-volume-release.git
pushd smb-volume-release
  direnv allow .
  git checkout master
  ./scripts/update
  ./scripts/build-broker
popd

pushd smb-volume-release/src/github.com/cloudfoundry/azurefilebroker
  zip -r $TARGET bin/azurefilebroker Procfile
popd

if [ "$1" = "-major" ]; then
  tile build major
elif [ "$1" = "-minor" ]; then
  tile build minor
else
  tile build
fi
