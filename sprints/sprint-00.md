# Sprint 0 (Nov 3 to Nov 16, 2026): Foundation
Goal: an OpenWrt One boots our signed OpenWrt image from CI, reads DIP state (MikroBUS breakout), and reports HW rev.

Committed: CELL-001, CELL-002, CELL-003, CELL-015
Stretch: CELL-004

Definition of done: tag `fw-v0.1.0` exists, image flashed on bench, `cat /etc/cell-release` shows version + hw-revA.

Buy list for Sprint 0 and 1 (CELL-022), about $330 to $400. Three units so a hop and a re-route can be tested (ADR 0014).
| Qty | Item | Est. | Where |
|---|---|---|---|
| 1 | OpenWrt One full kit (board, case, PoE module, antennas) | $95-130 | Amazon (search "openwrt one"), Banana Pi AliExpress store |
| 2 | Cudy WR3000P (MT7981B, PoE powered, 512MB/128MB NAND, OpenWrt) | $70-90 ea | Amazon B0FG3D2SDY |
| 1 | PoE+ 802.3at gigabit switch, 5-8 port, unmanaged | $40-60 | Amazon |
| 1 | Seeed XIAO nRF52840 or equivalent nRF52840 dev board | $10-15 | Amazon |
| 1 | 8-position DIP switch, through-hole | $6 | Amazon |
| 1 | AT24C02 I2C EEPROM breakout | $6 | Amazon |
| 1 | MikroBUS proto board | $8 | Amazon |
| 1 | Dupont jumper kit | $7 | Amazon |
| 3 | Cat6 patch cables, 3 ft | $10 | Amazon |
No USB-TTL adapter: the One has USB-C console built in. No PoE injector: the switch covers it.
Fallback if the One is out of stock: 3x WR3000P, order the One later.
