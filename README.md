# aiusage Homebrew tap

This public tap distributes reviewed, precompiled releases of `aiusage`, a local dashboard for understanding AI coding usage.

## Install

```sh
brew install mrexhepi/tap/aiusage
brew services start aiusage
open http://127.0.0.1:7878
```

No Go installation or source checkout is required. The service binds only to `127.0.0.1` and runs as the signed-in user.

## Upgrade

```sh
brew update
brew upgrade aiusage
brew services restart aiusage
```

## Uninstall

```sh
brew services stop aiusage
brew uninstall aiusage
```

Usage history and local configuration under `~/.aiusage` are preserved by Homebrew package removal.

## Privacy

This repository contains only the Homebrew formula and release archives. It does not contain user transcripts, prompts, indexes, configuration, internal repository names, or the private application source history.
