# Tibbo Layers

## Preparing the source tree

### 1. REPO tool installation [described there](/../../)

> Choose the dir where are you going to do all work. Say,
> ```
> ~/workspace/tibbo-layers/
> ```
> create it and go inside...


### 2. Fetching the working tree
```
repo3 init -u git@github.com:tibbotech/repo-manifests.git -m yocto-layers/default.xml
repo3 sync
patch -d tibbo/openembedded-core/ -p0 < tibbo/meta-tibbo/npm.dunfell.patch
```

### 3. Configuring the Tibbo Layers
```
TEMPLATECONF=`pwd`/tibbo/meta-tibbo/build.tppg2/conf . tibbo/openembedded-core/oe-init-build-env ./build.tppg2
install -d conf/multiconfig
install -D ../tibbo/meta-tibbo/build.tppg2/conf/multiconfig/* conf/multiconfig/
```

### 4. Setup separate dirs for downloads and build files:
```
install -m 0644 ../tibbo/meta-tibbo/build.all/site.conf conf/
```
Check the pathes defined at conf/site.conf

## Running the build

### Initiate the environment for build commands
go to your workdir
```
cd ~/workspace/tibbo-layers/
```
and initiate the ENV for builds
```
. tibbo/openembedded-core/oe-init-build-env ./build.tppg2
```
Run this command once before starting any 'bitbake ...'.
Please, note ". " (point and space) before "tibbo/..".

### Run builds in the same console session
```
bitbake ...
```
