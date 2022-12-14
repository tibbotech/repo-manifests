#!/bin/bash

if [ ! -x ~/bin/repo3 ]; then
  echo "Installing REPO tool..."
  install -d ~/bin/
  curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo3 && \
  chmod a+x ~/bin/repo3
fi;
PATH=$PATH:~/bin

M="${M:-default}"

hash python
if [ $? -ne 0 ]; then
  echo "python expected to exist in your system"
  exit 1;
fi;
hash python3
if [ $? -ne 0 ]; then
  echo "python3 expected to exist in your system"
  exit 1;
fi;
x0=($(md5sum `which python`));
x1=($(md5sum `which python3`));
if [ "${x0}" != "${x1}" ]; then
  echo "python should be a link to python3 in your system"
  exit 1;
fi;

repo3 init -u https://github.com/tibbotech/repo-manifests.git -m yocto-layers/${M}.xml && \
repo3 sync

if [ $? -ne 0 ]; then  exit 1;  fi;

patch -d layers/openembedded-core/ -p0 < layers/meta-tibbo/npm.dunfell.patch

TEMPLATECONF=`pwd`/layers/meta-tibbo/build.tppg2/conf . layers/openembedded-core/oe-init-build-env ./build.tppg2

if [ -d ../layers/meta-tibbo/build.tppg2/conf/multiconfig ]; then
  install -d conf/multiconfig
  install -D ../layers/meta-tibbo/build.tppg2/conf/multiconfig/* conf/multiconfig/
fi;

install -m 0644 ../layers/meta-tibbo/build.all/site.conf conf/
echo "------------------------"
echo "Please, edit build.tpp2/conf/site.conf build directories PATHes"
