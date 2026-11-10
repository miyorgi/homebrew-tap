# Miyorgi Homebrew tap

Install the signed and notarized Miyorgi C4 CLI on macOS:

```sh
brew install --cask miyorgi/tap/c4
```

Homebrew selects Apple Silicon or Intel and verifies the archive checksum.
Then run this in the project you want to model:

```sh
miyorgi c4 setup
```

Choose Codex or Claude Code, restart the assistant, and ask it to use the C4 skill.
The skill is bundled with the CLI. No separate skill download is required.

## Update or uninstall

```sh
brew update
brew upgrade --cask miyorgi/tap/c4
```

After upgrading, rerun `miyorgi c4 setup` in your projects to refresh the bundled
skill and recorded executable path. A different existing C4 skill is preserved;
use `--force` only when you intend to replace it.

```sh
brew uninstall --cask miyorgi/tap/c4
```

Uninstalling removes the Homebrew package and command link. It leaves your models
and project skills in place. Skills that reference the removed executable need
another CLI installation or a new setup run before they can check or preview models.

## Releases

Release archives stay on https://downloads.miyorgi.com/. This public repository
contains installation metadata and maintenance scripts, not the private CLI source.
The cask is beta software. Homebrew installation does not imply independent
Homebrew endorsement or company IT approval.

The update workflow checks the published release manifest hourly and can also run
manually. It updates only signed releases with both Mac architectures. Checksums
and URLs are pinned in the cask; installation does not execute an unpinned latest file.

See https://miyorgi.com/c4/ for the product and direct downloads. This repository
does not change the license terms of the CLI or its bundled dependencies.
