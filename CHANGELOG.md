# Changelog

## product-v0 (2026-11-02) at commit 2f34206
Scaffold release. No hardware, no firmware. Decisions and plan only.
- ADR 0001-0006 (SoM build-vs-buy, dual radio, DIP Cell join, DevOps pipeline, pricing tiers, Pro-only focus at 65% GM)
- Versioning policy, compatibility matrix, compat-gate CI job
- Join protocol v0 draft
- Backlog CELL-001 to CELL-021, Sprint 0 and Sprint 1 plans

Note: the git tag `product-v0` could not be pushed from the build session. This file is the source of truth for release points until tags are in place.

## fw-v0.0.1-dev (2026-11-02) at commit 89a6f9c
First CI-built images. OpenWrt 24.10.5, mediatek/filogic, profiles openwrt_one (placeholder for carrier revA) and cudy_wr3000p-v1 (bench). LuCI, DHCP server, firewall, PPP, VPN removed. wpad-mbedtls full (mesh, SAE, k/v/r). cell-agent v0 skeleton. Unsigned until CELL-030.
