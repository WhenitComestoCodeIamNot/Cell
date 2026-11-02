# Backlog (single source of truth)
Format: `CELL-nnn | P0-P3 | area | title | status`

CELL-001 | P0 | hw | Choose dev board for hw-revA prototype | done (ADR 0007: OpenWrt One + Cudy WR3000P)
CELL-002 | P0 | fw | OpenWrt ImageBuilder config + GitHub Action producing signed sysupgrade | in-progress (build.sh + workflow written, needs first CI run + USIGN_SECKEY secret)
CELL-003 | P0 | fw | HW rev detection via strap resistors + EEPROM, LED code on mismatch | todo
CELL-004 | P0 | fw | A/B partition layout + auto-rollback on boot fail | todo
CELL-005 | P0 | fw | cell-agent daemon: DIP read, Seed/Node role, join window timer | todo
CELL-006 | P0 | fw | Join protocol v0 implementation (SAE PAKE, config push) | todo
CELL-007 | P1 | fw | 4-address WDS bridge to upstream + TX power cap (ADR 0013) | todo
CELL-008 | P1 | ctl | Review OpenWISP for ideas only; stack decided in ADR 0011 | todo
CELL-009 | P1 | ctl | Canary rollout + telemetry MVP | todo
CELL-010 | P1 | spec | Decide SPAKE2 vs SAE | todo
CELL-011 | P1 | spec | Seed also relays traffic? | todo
CELL-012 | P1 | spec | Two-Seed conflict resolution test cases | todo
CELL-013 | P1 | hw | Carrier board revA in KiCad: 802.3at PoE PD, single-port PSE passthrough, 2x RJ45, nRF52840 module + UART, DC-DC, DIP, button, LED, USB-C fallback | todo
CELL-014 | P2 | hw | Enclosure v0 on K2 (proxy for metal shell), door-adjacent mount, SoM thermal check | todo
CELL-015 | P2 | ci | compat-gate job parsing COMPAT.md | todo
CELL-016 | P2 | ci | HIL bench: 3 units, flash on PR, join + iperf test | todo
CELL-017 | P1 | app | Installer + fleet UI MVP (React/Vite/Capacitor): fleet table, open join window, confirm name, promote to Seed | todo
CELL-018 | P3 | biz | Reseller margin model + controller subscription pricing | todo
CELL-019 | P3 | biz | Cert vendor quotes (unintentional radiator, US + EU) | todo
CELL-020 | P1 | biz | COGS tracker: live BOM cost per HW rev, alarm if landed > $45 (ADR 0009) | todo
CELL-021 | P2 | hw | Quote metal shell at 500/1k/5k (sheet vs die-cast) | todo
CELL-022 | P0 | hw | Order Sprint 0 parts (see sprints/sprint-00.md buy list) | todo
CELL-023 | P1 | hw | MikroBUS breakout: 8-pos DIP on GPIO + 24C02 EEPROM on I2C | todo
CELL-024 | P1 | biz | Provisional patent: P1+P2 from docs/MARKET.md, before first public demo | todo
CELL-025 | P2 | fw | Per-room bandwidth cap + client isolation | dropped (ADR 0013, inherited from upstream via 4-addr bridge)
CELL-026 | P3 | fw | Satellite-aware backhaul mode (cruise) | todo
CELL-027 | P1 | fw | Per-room PSK | dropped (ADR 0013, upstream AP feature, pass-through only)
CELL-028 | P1 | fw | nRF52840 IoT gateway: UART bridge, BLE + 802.15.4, controller exposure | todo
CELL-029 | P1 | hw | PSE passthrough: part selection, power budget at 25.5 W in / 15 W out, isolation and inrush review | todo
CELL-030 | P0 | ci | Generate usign keypair offline, store USIGN_SECKEY in repo secrets, commit public key to firmware/files/etc/opkg/keys | todo
CELL-031 | P1 | ctl | cellctl serve: SQLite mode, enroll + heartbeat gRPC, fleet REST, embed app/dist | todo
CELL-032 | P2 | app | BLE provisioning over nRF52840 via Capacitor (iOS requires native wrapper) | todo
CELL-033 | P1 | ctl | OIDC SSO (Entra, Google, Okta, magic link) + per-site RBAC (Owner/Admin/Installer/Viewer) | todo
CELL-034 | P1 | ctl | Tenant model Org>Site>Cell>Unit + audit log of every join, promotion, OTA, config change | todo
CELL-035 | P1 | ops | Hosting: VPS + Postgres + Caddy TLS, app.<celldomain>, outbound-only unit transport on 443 | todo
CELL-036 | P1 | fw | Per-hop throughput telemetry and long-chain warning (we are not the bottleneck) | todo
CELL-037 | P1 | app | Coverage map: per-floor signal heat from guest-device RSSI, topology view (AP > Seed > Nodes, hop count), clients view | todo
CELL-038 | P1 | app | Layout editor: built-in room grid, drag rooms and units, upload floor plan PDF/PNG to trace over, per site and floor | todo
CELL-039 | P1 | app | Per-device heat: shade floor by one unit's view (what it hears upstream, what neighbours hear from it); re-parent action | todo
CELL-040 | P1 | fw | Telemetry for map: neighbour RSSI table, per-client RSSI, parent link, every 60 s | todo
