# Tibbo REPOs
-----------

[yocto-layers](yocto-layers/) Yocto/OE Linux, BSP and Apps


## Setting up REPO tool

```
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo3
chmod a+x ~/bin/repo3

```

## Installing certain manifests

```
repo3 init -u git@github.com:tibbotech/repo-manifests.git -m subfolder/some.xml
repo3 sync
```

## External links to REPO documentation

[git and references](https://gerrit.googlesource.com/git-repo)

[description and references](https://source.android.com/setup/develop)

[commands](https://source.android.com/docs/setup/create/repo)

[syntax](https://gerrit.googlesource.com/git-repo/+/master/docs/)

[manifest format](https://gerrit.googlesource.com/git-repo/+/master/docs/manifest-format.md)
