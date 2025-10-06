# docker-wraps-nvm-module
Implements module nvm for docker wraps environment.

## Usage
Add `docker-wraps-nvm-module` to as submodule to your project:
```bash
git submodule add https://github.com/RomaTk/docker-wraps-nvm-module.git modules/<name-you-like>
```

## Wraps:
After that you will have the following wraps available:
- `nvm-get-latest-version`
- `nvm-download`
- `nvm-download-with-configs`
- `nvm-install`

You can specify which version of nvm you want to use by modifying `build.run.before` in `nvm-install` wrap. Within:
```bash
source ./env-scripts/nvm/install/prepare-before-build.sh && main "<VERSION>" "linux" "./dockers/nvm"
```
if no version is specified, latest version will be used.

## Requirements

To use you need to have modules:
- https://github.com/RomaTk/docker-wraps-backups-module.git
    - This module will allow to avoid rebuilding images if they are already built.
- https://github.com/RomaTk/docker-wraps-ubuntu-module.git
    - This module will allow to have ubuntu image as base for git images.
- https://github.com/RomaTk/docker-wraps-install-some-util-module.git
    - This module will provide env-scripts for common way to install some utils in the docker wraps environment.

