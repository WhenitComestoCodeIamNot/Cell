# Sprint 0 (Nov 3 to Nov 16, 2026): Foundation
Goal: an OpenWrt One boots our signed OpenWrt image from CI, reads DIP state (MikroBUS breakout), and reports HW rev.

Committed: CELL-001, CELL-002, CELL-003, CELL-015
Stretch: CELL-004

Definition of done: tag `fw-v0.1.0` exists, image flashed on bench, `cat /etc/cell-release` shows version + hw-revA.

Buy list for Sprint 0 and 1 (CELL-022). Ordered 2026-11-02 as two complete kits (four units). About $450 to $600.
| Qty | Item | Est. | Where |
|---|---|---|---|
| 2 | OpenWrt One full kit (board, case, PoE module, antennas) | $95-130 ea | Amazon (search "openwrt one"), Banana Pi AliExpress store |
| 2 | Cudy WR3000P (MT7981B, PoE powered, 512MB/128MB NAND, OpenWrt) | $70-90 ea | Amazon B0FG3D2SDY |
| 2 | Seeed XIAO nRF52840 or equivalent | $10-15 ea | Amazon |
| 2 | AT24C02 I2C EEPROM breakout | $6 ea | Amazon |
| 2 | MikroBUS proto board | $8 ea | Amazon |
| 1 | 8-position DIP switch pack | $6 | Amazon |
| 1 | PoE+ 802.3at gigabit switch, 8 port, unmanaged | $50-70 | Amazon |
| 1 | Dupont jumper kit | $7 | Amazon |
| 4 | Cat6 patch cables, 3 ft | $12 | Amazon |
No USB-TTL adapter: the One has USB-C console built in. No PoE injector: the switch covers it.
Four units covers the multi-hop re-route test (ADR 0014) without a second order.
