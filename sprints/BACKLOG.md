# Backlog (single source of truth)
Format: `CELL-nnn | P0-P3 | area | title | status`

CELL-001 | P0 | hw | Choose dev board for hw-revA prototype | done (ADR 0007: OpenWrt One + Cudy WR3000)
CELL-002 | P0 | fw | OpenWrt ImageBuilder config + GitHub Action producing signed sysupgrade | todo
CELL-003 | P0 | fw | HW rev detection via strap resistors + EEPROM, LED code on mismatch | todo
CELL-004 | P0 | fw | A/B partition layout + auto-rollback on boot fail | todo
CELL-005 | P0 | fw | cell-agent daemon: DIP read, Seed/Node role, join window timer | todo
CELL-006 | P0 | fw | Join protocol v0 implementation (SAE PAKE, config push) | todo
CELL-007 | P1 | fw | TX power cap + per-room guest VLAN isolation | todo
CELL-008 | P1 | ctl | Evaluate OpenWISP vs custom controller, write ADR 0006 | todo
CELL-009 | P1 | ctl | Canary rollout + telemetry MVP | todo
CELL-010 | P1 | spec | Decide SPAKE2 vs SAE | todo
CELL-011 | P1 | spec | Seed also relays traffic? | todo
CELL-012 | P1 | spec | Two-Seed conflict resolution test cases | todo
CELL-013 | P1 | hw | Carrier board revA in KiCad: 802.3at PoE PD, DC-DC, DIP, button, LED, USB-C fallback | todo
CELL-014 | P2 | hw | Enclosure v0 on K2 (proxy for metal shell), door-adjacent mount, SoM thermal check | todo
CELL-015 | P2 | ci | compat-gate job parsing COMPAT.md | todo
CELL-016 | P2 | ci | HIL bench: 3 units, flash on PR, join + iperf test | todo
CELL-017 | P2 | app | Installer app MVP: open join window, confirm name, promote to Seed | todo
CELL-018 | P3 | biz | Reseller margin model + controller subscription pricing | todo
CELL-019 | P3 | biz | Cert vendor quotes (unintentional radiator, US + EU) | todo
CELL-020 | P1 | biz | COGS tracker: live BOM cost per HW rev, alarm if landed > $35 | todo
CELL-021 | P2 | hw | Quote metal shell at 500/1k/5k (sheet vs die-cast) | todo
CELL-022 | P0 | hw | Order Sprint 0 parts (see sprints/sprint-00.md buy list) | todo
CELL-023 | P1 | hw | MikroBUS breakout: 8-pos DIP on GPIO + 24C02 EEPROM on I2C | todo
