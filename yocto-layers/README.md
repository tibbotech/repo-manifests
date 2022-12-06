# Tibbo Layers

**
Skip 1~4 steps when using [automated setup](/../../) and go to 
"Running the build" step right after running the script.
**

## Preparing the source tree

### 1. REPO tool installation [described there](/../../)

> Choose the dir where are you going to do all work. Say,
> ```
> ~/workspace/tibbo-layers/
> ```
> create it and go inside...


### 2. Fetching the working tree
```
repo3 init -u https://github.com/tibbotech/repo-manifests.git -m yocto-layers/default.xml
repo3 sync
patch -d layers/openembedded-core/ -p0 < layers/meta-tibbo/npm.dunfell.patch
```

### 3. Configuring the Tibbo Layers
```
TEMPLATECONF=`pwd`/layers/meta-tibbo/build.tppg2/conf . layers/openembedded-core/oe-init-build-env ./build.tppg2
```

### 4. Setup separate dirs for downloads and build files:
```
install -m 0644 ../layers/meta-tibbo/build.all/site.conf conf/
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
. layers/openembedded-core/oe-init-build-env ./build.tppg2
```
Run this command once before starting any 'bitbake ...'.
Please, note ". " (point and space) before "layers/..".

### (Optional) Adding your layer
After "Initiate the env..."
For **public** layer:
```
git clone https://github.com/someproject/somelayer.git layers/meta-mylayer
bitbake-layers add-layer ../layers/meta-mylayer/
```
For **private** layer:
```
git clone git@github.com:someproject/somelayer.git layers/meta-mylayer
bitbake-layers add-layer ../layers/meta-mylayer/
```
### Run builds in the same console session
```
MACHINE=... bitbake ...
```
