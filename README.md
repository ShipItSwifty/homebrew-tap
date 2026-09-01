# homebrew-tap

Homebrew tap for [ShipItSwifty](https://github.com/ShipItSwifty/shipitswifty) tools —
Swift-native CLIs for iOS and Android release automation.

## Install

```sh
brew tap shipitswifty/tap
brew trust shipitswifty/tap   # Homebrew 6+ requires trusting non-official taps once

brew install shipit                 # release-automation CLI
brew install app-store-connect-mcp  # App Store Connect / Xcode Cloud MCP server
```

> `brew trust` is a one-time, per-machine step. Without it, Homebrew 6 refuses to
> load the formulae ("Refusing to load formula … from untrusted tap"). CI images
> set `HOMEBREW_NO_REQUIRE_TAP_TRUST=1` instead — see [CI Install](#ci-install).

## Usage

```sh
shipit --help
shipit --version

app-store-connect-mcp --help
app-store-connect-mcp --version
```

## Formulas

| Formula | Version | Description |
|---------|---------|-------------|
| `shipit` | 0.6.1 | Swift-native CLI for iOS and Android app release automation |
| `app-store-connect-mcp` | 0.1.4 | MCP server for the App Store Connect and Xcode Cloud read API |

## Upgrade

```sh
brew update
brew upgrade shipit
brew upgrade app-store-connect-mcp
```

## CI Install

Use the tap in CI the same way as local installs. Homebrew downloads the prebuilt binary — no Swift toolchain or compilation required.

```sh
export HOMEBREW_NO_REQUIRE_TAP_TRUST=1   # non-interactive equivalent of `brew trust`
brew tap shipitswifty/tap
brew install shipit
shipit --version
```

## Maintainer Release Flow

Each formula has its own `Update Formula` workflow that polls the matching upstream
repo on a schedule (and on manual dispatch).

| Formula | Upstream repo | Release archives | Updater workflow |
|---------|---------------|------------------|------------------|
| `shipit` | `ShipItSwifty/shipitswifty` | `shipit-<VERSION>-macos-universal.tar.gz`, `shipit-<VERSION>-linux-static.tar.gz` | `Update Formula` |
| `app-store-connect-mcp` | `ShipItSwifty/app-store-connect-mcp` | `app-store-connect-mcp-<VERSION>-macos-universal.tar.gz`, `app-store-connect-mcp-<VERSION>-linux-x86_64.tar.gz` | `Update Formula (app-store-connect-mcp)` |

1. Tag and release the upstream source repo (e.g. `0.2.1`).
2. The upstream `Release` workflow uploads the prebuilt archives listed above.
3. Let the matching `Update Formula` workflow pick up the release, or run it manually with the released version.
4. The updater downloads both archives, computes their SHA256, updates the formula and this README, then commits and pushes to `main`.
5. Verify a fresh install works:

```sh
brew untap shipitswifty/tap || true
brew uninstall --force shipit app-store-connect-mcp || true
brew tap shipitswifty/tap
brew trust shipitswifty/tap
brew install shipit app-store-connect-mcp
shipit --version
app-store-connect-mcp --version
```

## Uninstall

```sh
brew uninstall shipit app-store-connect-mcp
brew untap shipitswifty/tap
```

## Contributing

Bugs and formula update requests belong in the upstream repository for the tool
([shipitswifty](https://github.com/ShipItSwifty/shipitswifty) or
[app-store-connect-mcp](https://github.com/ShipItSwifty/app-store-connect-mcp)).
Open issues there rather than here.

Pull requests that bump the formula version are welcome once a new release is tagged upstream.

## License

[MIT](LICENSE)
