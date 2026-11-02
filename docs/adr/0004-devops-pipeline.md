# ADR 0004: OpenWrt ImageBuilder in GitHub Actions, signed A/B OTA, fleet controller
Date: 2026-11-02 | Status: Accepted

## Decision
- Firmware: OpenWrt ImageBuilder, one image per HW rev per tag, signed with an offline key.
- A/B flash partitions. Failed boot after OTA auto-reverts.
- Controller: self-hosted, canary rollout, telemetry, per-site config. Evaluate OpenWISP first before writing our own.
- Hardware-in-the-loop bench: 3 units flash every PR build, run join + throughput test.

## Why
A bricked unit in a hotel room is a truck roll. A/B plus canary is the cheapest insurance.
