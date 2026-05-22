# homebrew-janus

[Homebrew](https://brew.sh) tap for [Janus](https://github.com/crewtives/janus) — the personal historian for makers.

## Install

```bash
brew install crewtives/janus/janus
```

Then run the interactive setup:

```bash
janus init
```

See the [main repo](https://github.com/crewtives/janus) for documentation, the FAQ, and what the wizard configures.

## Versioning

The formula tracks the latest [Janus release](https://github.com/crewtives/janus/releases). Each tag in the main repo triggers an automated bump PR here once the maintainer activates the `homebrew-bump` job. Until then, formula updates are manual.

## Manual update procedure

```bash
# 1. Find the new release tag and the SHA256SUMS file
gh release download <TAG> -p SHA256SUMS -R crewtives/janus

# 2. Edit Formula/janus.rb: update `version` and the four `sha256` lines

# 3. Commit + push
git add Formula/janus.rb && git commit -m "janus <NEW_VERSION>" && git push
```

## License

MIT — see the LICENSE in the [main repo](https://github.com/crewtives/janus/blob/main/LICENSE).
