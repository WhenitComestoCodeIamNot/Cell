# Versioning Policy

## External (what customers see)
`product-v1`, `product-v1.1`. Printed on the box, shown in app. Bumps only when a customer would notice: new tier, new radio, new feature set. Owned by product, not engineering.

## Internal (four independent tracks)

| Track | Format | Where it lives | Bump when |
|---|---|---|---|
| Hardware | `hw-revA`, `hw-revB` | EEPROM byte 0x00, silkscreen, strap resistors R90/R91 | Any PCB change, any BOM substitution that affects RF, power or memory |
| Firmware | `fw-vMAJOR.MINOR.PATCH+gitsha` | `/etc/cell-release` | semver. MAJOR = join protocol break. MINOR = feature. PATCH = fix |
| Controller | `ctl-vX.Y.Z` | container tag | semver |
| App | `app-vX.Y.Z` | store build | semver |

## Hardware rev detection at boot
Firmware reads strap resistors first (cheap, no I2C needed), then EEPROM. If they disagree, boot halts with LED code 3 and reports to controller. Never guess.

## Compatibility matrix
`docs/COMPAT.md` is the source of truth. CI job `compat-gate` parses it and fails any build whose `(hw-rev, fw-major)` pair is absent. Adding a row is a PR with an ADR link.

## Release flow
1. PR merged to `main` with CELL-nnn reference.
2. Tag `fw-vX.Y.Z` → CI builds one signed sysupgrade image per HW rev in COMPAT.
3. Images land in controller as `staged`.
4. Canary: 5% of a site for 48h. Auto-rollback on telemetry regression.
5. Promote to `stable`. Changelog generated from PR titles.

## Never
- Never reuse a tag.
- Never ship an unsigned image.
- Never let firmware write to the HW rev EEPROM byte.
