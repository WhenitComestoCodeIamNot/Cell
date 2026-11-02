# Backlog (single source of truth)
Format: `CELL-nnn | P0-P3 | area | title | status`

CELL-001 | P0 | hw | Choose dev board | superseded by ADR 0016 (straight to carrier)
CELL-002 | P0 | fw | OpenWrt ImageBuilder config + GitHub Action producing sysupgrade images | done 2026-11-02, CI green, 8-9 MB images; signing pending CELL-030
CELL-003 | P0 | fw | HW rev detection via strap resistors + EEPROM, LED code on mismatch | todo
CELL-004 | P0 | fw | A/B partition layout + auto-rollback on boot fail | todo
CELL-005 | P0 | fw | cell-agent daemon: DIP read, Seed/Node role, join window timer | todo
CELL-006 | P0 | fw | Join protocol v0 implementation (SAE PAKE, config push, then join mesh per ADR 0014) | todo
CELL-007 | P1 | fw | 4-address WDS bridge to upstream + TX power cap (ADR 0013) | todo
CELL-008 | P1 | ctl | Review OpenWISP for ideas only; stack decided in ADR 0011 | todo
CELL-009 | P1 | ctl | Canary rollout + telemetry MVP | todo
CELL-010 | P1 | spec | Decide SPAKE2 vs SAE | todo
CELL-011 | P1 | spec | Seed also relays traffic? | todo
CELL-012 | P1 | spec | Two-Seed conflict resolution test cases | todo
CELL-013 | P0 | hw | Carrier board revA in KiCad: 802.3at PoE PD, single-port PSE passthrough, 2x RJ45, nRF52840 module + UART, DC-DC, DIP, button, LED, USB-C fallback | todo
CELL-014 | P2 | hw | Enclosure v0 on K2 (proxy for metal shell), door-adjacent mount, SoM thermal check | todo
CELL-015 | P2 | ci | compat-gate job parsing COMPAT.md | done 2026-11-02
CELL-016 | P2 | ci | HIL bench: 3 units, flash on PR, join + iperf test | todo
CELL-017 | P1 | app | Installer + fleet UI MVP (React/Vite/Capacitor): fleet table, open join window, confirm name, promote to Seed | todo
CELL-018 | P3 | biz | Reseller margin model + controller subscription pricing | todo
CELL-019 | P3 | biz | Cert vendor quotes (unintentional radiator, US + EU) | todo
CELL-020 | P1 | biz | COGS tracker: live BOM cost per HW rev, alarm if landed > $45 (ADR 0009) | todo
CELL-021 | P2 | hw | Quote metal shell at 500/1k/5k (sheet vs die-cast) | todo
CELL-022 | P0 | hw | Order parts per ADR 0016 list (sprints/sprint-00.md) | ordering 2026-11-02
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
CELL-041 | P0 | fw | 802.11s mesh backhaul with HWMP airtime metric, hysteresis, WDS fallback (ADR 0014) | todo
CELL-042 | P1 | fw | 802.11k neighbour reports incl. property APs, 802.11v BSS transition, 802.11r within Cell | todo
CELL-043 | P1 | fw | Steering daemon: client RSSI thresholds, candidate selection, usteer-style coordination over mesh | todo
CELL-044 | P1 | fw | Gateway election: any unit with good upstream can uplink, cap per Cell (default 3) | todo
CELL-045 | P1 | fw | Peer firmware distribution: cache, announce, fetch with resume, verify before install (ADR 0015) | todo
CELL-046 | P2 | ctl | Rollout view shows propagation: who got the image from whom, when | todo
CELL-047 | P1 | hw | Second WR3000P for multi-hop test | covered by CELL-022 (four units)
CELL-048 | P0 | hw | Pick MT7981B module: HLK-RM65 vs Openembed SOM-7981 (RAM, pinout, cert, price, MOQ, OpenWrt state). ADR 0007b | todo
CELL-049 | P0 | fw | Module bring-up: DTS, bootloader, PoE PD/PSE GPIO, nRF52840 UART, strap/EEPROM pins; add hw-revA profile | todo
CELL-050 | P0 | hw | Carrier revA outline + jack positions frozen, handed to enclosure (CELL-014) | todo
CELL-051 | P2 | hw | Region cord kits (C7 to NEMA 1-15, CEE 7/16, BS 1363) for the C8 inlet | todo
CELL-052 | P1 | hw | Power budget and thermal check: 25.5 W in, 15.4 W passthrough, sealed metal shell | todo
CELL-053 | P1 | hw | End-product safety evaluation (IEC 62368-1) with encapsulated AC-DC module: scope, lab quotes, timeline | todo
CELL-054 | P0 | hw | Power section design: 12 V bus, IRM-30-12, PoE PD (12 V out), USB-C PD sink 12 V, ORing mains > PoE > USB-C, 4S LiFePO4 on bus, 12-48 V boost for PSE | todo
CELL-055 | P1 | hw | 4S LiFePO4 pack selection (certified, 12.8 V, 10-15 Wh) + charger IC (ADR 0018) | todo
CELL-056 | P1 | fw | Low-power mode on battery: guest radio off, mesh + heartbeat on | todo
CELL-057 | P0 | hw | RTC supercap + hold-up capacitance + last-gasp power-loss event | todo
CELL-058 | P0 | fw | Event schema, metrics, flash ring buffer, store-and-forward (specs/logging-alerting.md) | todo
CELL-059 | P1 | ctl | Event and metric ingest, index, search, retention | todo
CELL-060 | P1 | ctl | Alert rules engine with default rules, routing, quiet hours, escalation; channels email/SMS/Slack/Teams/PagerDuty/webhook | todo
CELL-061 | P1 | ctl | Audit log stream + export | todo
CELL-062 | P1 | app | Alerts page and Audit log page | todo
CELL-063 | P1 | hw | EMC pre-compliance: surge (61000-4-5), ESD (61000-4-2), EFT (61000-4-4) on mains, RJ45, USB-C; lab or bench tester | todo
CELL-064 | P1 | fw | Power-quality telemetry: input voltage sense, brownout and input-switch events, per-unit counters in console | todo
