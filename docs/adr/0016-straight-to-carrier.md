# ADR 0016: Go straight to our carrier board on an MT7981B module. One mainline dev board stays as a bench tool.
Date: 2026-11-02 | Status: Accepted | Amends ADR 0007 (OpenWrt One dropped)

## Decision
- No dev-board phase for hardware. The first Cell units are our carrier board (CELL-013) around a purchased MT7981B module, fabbed and assembled at JLCPCB, in a K2-printed case designed to the carrier outline.
- Module shortlist (CELL-001 reopened as CELL-048, decide within 2 days): Hi-Link HLK-RM65 (MT7981B + MT7976C + MT7531A, 256 MB DDR3, 128 MB SPI NAND, 60 x 90 mm, I-PEX antennas, UART/GPIO/I2C/USB, dev kit with schematics and PCB reference, ~$75) vs Openembed SOM-7981 (sold as CE/FCC certified; confirm RAM, pinout, pricing, MOQ).
- We never route the MT7981B bare: DDR, RF and intentional-radiator certification stay inside the module (ADR 0001).
- One Cudy WR3000P is bought as a firmware bench tool only. It is the only PoE-powered MT7981B device with mainline OpenWrt support, so the CI image runs on it with no bring-up, and join/mesh work proceeds while the carrier is in fab. It gets no case and is not a product rev.
- OpenWrt One is dropped.

## Consequences
- COMPAT.md: hw-revA becomes "Cell carrier revA on <module>"; the WR3000P row stays as bench-only.
- Firmware bring-up on the chosen module (device tree, bootloader, PoE PD/PSE GPIO, nRF UART) is a new P0 item (CELL-049). Neither candidate module is in mainline OpenWrt; budget 3 to 5 days.
- Sprint 0 goal changes: CI image boots on WR3000P (bench) AND carrier revA schematic + outline frozen so the case can start.
- Timeline: module pick 2 d, carrier design 4 to 6 d, fab + assembly 7 to 12 d, bring-up 3 to 5 d. First Cell units on our own board in about 3 to 4 weeks.
