#!/bin/bash
set +e +x

rm -f resources/azurefilebroker.zip
rm -fr smb-volume-release

git clone https://github.com/cloudfoundry/smb-volume-release.git
pushd smb-volume-release
  direnv allow .
  git checkout master
  ./scripts/update
  ./scripts/build-broker
popd

DSTPATH=smb-volume-release/src/github.com/cloudfoundry/azurefilebroker
zip -j resources/azurefilebroker.zip $DSTPATH/bin/azurefilebroker $DSTPATH/manifest.yml $DSTPATH/Procfile

if [ "$1" = "-major" ]; then
  tile build major
elif [ "$1" = "-minor" ]; then
  tile build minor
else
  tile build
fi
