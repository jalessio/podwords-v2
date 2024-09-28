# SQLite to MySQL database-migrator

Copied from https://github.com/grafana/database-migrator with the following changes:

- `awk` was replaced with `gawk` in ordere to run on macOS. This required running `brew install gawk`.
- I double-quoted `$DB` to get it to pass `shellcheck` in `pre-commit`
