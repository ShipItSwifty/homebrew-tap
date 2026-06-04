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
| `shipit` | 0.1.0 | Swift-native CLI for iOS and Android app release automation |

## Upgrade

```sh
brew update
brew upgrade shipit
```

## CI Install

Use the tap in CI the same way as local installs. Once bottles are published, Homebrew downloads the prebuilt artifact instead of compiling `shipit` from source.

```sh
brew tap shipitswifty/tap
brew install shipit
shipit --version
```

If an install unexpectedly builds from source, check whether `Formula/shipit.rb` has a `bottle do` block for the runner's macOS version and architecture.

## Maintainer Release Flow

1. Tag and release the upstream source repo, for example `0.1.0` in `ShipItSwifty/shipitswifty`.
2. Update `Formula/shipit.rb` with the new source tarball `url` and `sha256`.
3. Update the formula version table in this README.
4. Commit and push the formula update.
5. Run the `Bottle` workflow manually with the released version. The workflow currently builds bottles on `macos-26`, `macos-15`, and `macos-14` so ShipItSwifty CI and common developer Macs can avoid source builds.
6. The workflow creates or updates a tap release named `shipit-<version>`, uploads bottle artifacts, merges the generated `bottle do` block into `Formula/shipit.rb`, and commits that bottle block back to `main`.
7. Verify a fresh install uses a bottle:

```sh
brew untap shipitswifty/tap || true
brew uninstall --force shipit || true
brew tap shipitswifty/tap
brew install shipit
brew list --poured-from-bottle | grep '^shipit$'
shipit --version
```

The formula still keeps a source-build fallback for platforms without a matching bottle.

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
