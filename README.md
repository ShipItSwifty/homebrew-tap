# homebrew-tap

Homebrew tap for [ShipItSwifty](https://github.com/ShipItSwifty/shipitswifty) — a Swift-native CLI toolkit for iOS and Android release automation.

## Install

```sh
brew tap shipitswifty/tap
brew install shipit
```

## Usage

```sh
shipit --help
shipit --version
```

## Formulas

| Formula | Version | Description |
|---------|---------|-------------|
| `shipit` | 0.2.2 | Swift-native CLI for iOS and Android app release automation |

## Upgrade

```sh
brew update
brew upgrade shipit
```

## CI Install

Use the tap in CI the same way as local installs. Homebrew downloads the prebuilt binary — no Swift toolchain or compilation required.

```sh
brew tap shipitswifty/tap
brew install shipit
shipit --version
```

## Maintainer Release Flow

1. Tag and release the upstream source repo (e.g. `0.2.1` in `ShipItSwifty/shipitswifty`).
2. Upload the prebuilt binaries to the GitHub release as `shipit-<VERSION>-macos-universal.tar.gz` and `shipit-<VERSION>-linux-static.tar.gz`.
3. Let the `Update Formula` workflow pick up the release, or run it manually with the released version.
4. The updater downloads both binaries, computes their SHA256, updates `Formula/shipit.rb` and this README, then commits and pushes to `main`.
5. Verify a fresh install works:

```sh
brew untap shipitswifty/tap || true
brew uninstall --force shipit || true
brew tap shipitswifty/tap
brew install shipit
shipit --version
```

## Uninstall

```sh
brew uninstall shipit
brew untap shipitswifty/tap
```

## Contributing

Bugs and formula update requests belong in the [ShipItSwifty](https://github.com/ShipItSwifty/shipitswifty) repository. Open issues there rather than here.

Pull requests that bump the formula version are welcome once a new release is tagged upstream.

## License

[MIT](LICENSE)
