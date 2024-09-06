# Archlinux Docker Action

Run scripts in Archlinux Docker Container in GitHub Actions

## Sample Usage

```yaml
name: Arch Linux Workflow

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build:
    permissions:
      contents: write
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: sharunkumar/archlinux-docker-action@v1
        with:
          script: build.sh
```

Where `build.sh` is a script that will be run in the Archlinux Docker Container, e.g.

```bash
makepkg --printsrcinfo >.SRCINFO
makepkg --noconfirm -si
```

Note: in the container, makepkg is patched to allow running as root. ref: [makepkg.patch](makepkg.patch)
