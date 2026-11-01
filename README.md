# mvsep environment

Conda environment and bootstrap scripts for [ZFTurbo MVSEP](https://github.com/ZFTurbo/MVSEP-MDX23-music-separation-model)

## install

```shell
# conda env + python + poetry
$ make env-create

# packages
$ make env-poetry-install
```

## run

[Command line options](https://github.com/ZFTurbo/MVSEP-MDX23-music-separation-model#all-available-keys)

```shell
# run stem separation, check the "separated/htdemucs" folder after
bin/mvsep.sh "song.mp3"
```

## cache

demucs/mvsep downloads the models to `~/.cache/torch/hub/`
