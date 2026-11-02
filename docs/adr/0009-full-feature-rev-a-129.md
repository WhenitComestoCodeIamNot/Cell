# ADR 0009: No deferred features. PoE passthrough, IoT radio and PPSK ship in hw-revA. Pro MSRP moves to $129.
Date: 2026-11-02 | Status: Accepted | Amends ADR 0006 (price), supersedes "fast follows" in MARKET.md s8

## Decision
Cell Pro v1 is the best unit in its class at launch, not after a revision. hw-revA carries:
- 802.3at PoE in, one PoE passthrough port (802.3af class 3, ~15 W) via a single-port PSE controller. Second RJ45 driven by the MT7981B internal switch.
- Pre-certified nRF52840 module over UART: BLE 5 + 802.15.4 (Zigbee, Thread, Matter). Exposed to the controller as an IoT gateway.
- Per-room PSK on the shared site SSID (hostapd multi-PSK), pushed by the Seed. Software only.
- Honest client spec: up to 128 stations per unit.

## Margin math
- Previous landed estimate (ADR 0006): $29 to $31.
- Adds: PSE controller + DC-DC uplift + second jack/magnetics $6 to $7; nRF52840 module $3.50; shell cutout and test time ~$0.50.
- New landed estimate: **$40 to $42 at 1k units.**
- At $100 MSRP that is ~59% GM. Below floor.
- **MSRP moves to $129.** COGS ceiling at 65% = $45. Headroom $3 to $5.
- Position: $50 under Ubiquiti U6 In-Wall ($179, no IoT radio, requires UniFi console), ~$470 under Ruckus H350 ($595 + licences).

## Consequences
- CELL-013 (carrier revA) scope: add PSE, second RJ45, nRF52840 footprint and UART, DC-DC resized.
- CELL-020 COGS tracker alarm moves from $35 to $45.
- CELL-014 enclosure: two jacks on the bottom edge, thermal check at 25 W PoE input.
- PPSK moves from Sprint 3 to Sprint 2.
- MARKET.md s8 "fast follows" shrinks to: satellite-aware mode, EasyMesh interop.
- Board bring-up risk: PSE adds a safety-relevant circuit (isolation, inrush). Budget one extra carrier spin.
