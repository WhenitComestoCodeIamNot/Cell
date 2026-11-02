# ADR 0011: Management stack. TypeScript web app (PWA + Capacitor), Go controller, C/shell device agent.
Date: 2026-11-02 | Status: Accepted

## Decision
| Layer | Choice | Ships as |
|---|---|---|
| Fleet UI + installer app | TypeScript, React, Vite, Tailwind. One codebase. | Browser (desktop mgmt), PWA (install from controller URL), Capacitor wrap for iOS App Store and Google Play |
| Controller | Go. Single static binary, embeds the built web UI. REST + WebSocket to UI, mTLS gRPC to units. Postgres in cloud mode, SQLite in single-property on-prem mode. | Container image `ctl-vX.Y.Z` and a bare binary |
| Device agent | Shell (v0) -> C for join protocol, OTA, telemetry. ucode for glue. | Part of the firmware image |

## Why
- Hotels manage from a desk, installers work from a phone. One responsive app serves both; PWA covers 90% of use with zero store friction.
- Capacitor is required only for BLE on iOS (provisioning over the nRF52840 before the unit has network). Android PWAs get Web Bluetooth; iOS does not.
- Go for the controller: static binary, trivial on-prem deploys, strong TLS/gRPC story, what the current generation of network infra companies use. UniFi and Omada are Java; not a pattern worth copying in 2026.
- C++/Qt or Electron for desktop would mean a second UI codebase. Rejected.
- Go or C++ on the device would mean 5 to 10 MB binaries on 16 to 128 MB flash. Rejected for the agent.

## Consequences
- `app/` is a Vite + React + Capacitor project. `controller/` is a Go module. Both versioned per VERSIONING.md.
- CI: app builds to static assets, controller embeds them with `go:embed`. One release tag `ctl-vX.Y.Z` ships both; `app-vX.Y.Z` tags only the store builds.
- OpenWISP evaluation (CELL-008) narrows to "steal ideas", not "adopt": it is Python/Django and does not fit this stack.
