# Tibbo REPOs

### Folders Description

[remotes](remotes/): General include files

[yocto-layers](yocto-layers/): Yocto/OE Linux, BSP and Apps

clone.sh: Helper script for automated REPOs setup

## Setting up Tibbo REPOs with helper script
```
curl https://raw.githubusercontent.com/tibbotech/repo-manifests/master/clone.sh > ./clone.sh && chmod 0755 ./clone.sh && ./clone.sh
```

## Setting up REPO tool and repos manually
```
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo3
chmod a+x ~/bin/repo3

```

## Installing certain manifests
```
repo3 init -u https://github.com/tibbotech/repo-manifests.git -m subfolder/some.xml
repo3 sync
```

## Problems running clone.sh

"python should be a link to python3 in your system"
```
ln -sf `which python` `which python3`
```
"python expected to exist in your system"
```
ln -s `which python3` /usr/bin/python
```

## External links to REPO documentation

[git and references](https://gerrit.googlesource.com/git-repo)

[description and references](https://source.android.com/setup/develop)

[commands](https://source.android.com/docs/setup/create/repo)

[syntax](https://gerrit.googlesource.com/git-repo/+/master/docs/)

[manifest format](https://gerrit.googlesource.com/git-repo/+/master/docs/manifest-format.md)
