#!/bin/bash

D="build.tppg2"

x=`dirname $0`
P=`readlink -e ${x}`

if [ ! -x ~/bin/repo3 ]; then
  echo "Installing REPO tool..."
  install -d ~/bin/
  curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo3 && \
  chmod a+x ~/bin/repo3
  sed -ie 's/env python$/env python3/' ~/bin/repo3
fi;
PATH=$PATH:~/bin

M="${M:-default}"

hash python3
if [ $? -ne 0 ]; then
  echo "python3 expected to exist in your system"
  exit 1;
fi;

for i in ${P}/C0.*.sh; do
  if [ ! -e "${i}" ]; then continue;  fi;
  . $i
done;

repo3 init -u https://github.com/tibbotech/repo-manifests.git -m yocto-layers/${M}.xml && \
if [ $? -ne 0 ]; then  exit 1;  fi;
repo3 sync
if [ $? -ne 0 ]; then  exit 1;  fi;

patch -d layers/openembedded-core/ -p0 < layers/meta-tibbo/npm.dunfell.patch

# there PWD=./
TEMPLATECONF=`pwd`/layers/meta-tibbo/build.tppg2/conf . layers/openembedded-core/oe-init-build-env ./${D}
# there PWD=./build.tppg2

# drop it soon
if [ -d ../layers/meta-tibbo/build.tppg2/conf/multiconfig ]; then
  install -d conf/multiconfig
  install -D ../layers/meta-tibbo/build.tppg2/conf/multiconfig/* conf/multiconfig/
fi;
# drop it soon /

install -m 0644 ../layers/meta-tibbo/build.all/site.conf conf/

# come back to old PWD
cd "${P}"

for i in ${P}/C1.*.sh; do
  if [ ! -e "${i}" ]; then continue;  fi;
  . $i
done;

echo "------------------------"
echo "Please, edit build.tpp2/conf/site.conf build directories PATHes"
