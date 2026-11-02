# Sprint 0 (Nov 3 to Nov 16, 2026): Foundation
Goal: an OpenWrt One boots our signed OpenWrt image from CI, reads DIP state (MikroBUS breakout), and reports HW rev.

Committed: CELL-001, CELL-002, CELL-003, CELL-015
Stretch: CELL-004

Definition of done: tag `fw-v0.1.0` exists, image flashed on bench, `cat /etc/cell-release` shows version + hw-revA.

Buy list for this sprint (CELL-022), about $230:
| Qty | Item | Est. | Where |
|---|---|---|---|
| 1 | OpenWrt One full kit (board, case, PoE module, antennas, PSU) | $89 to $125 | Banana Pi store on AliExpress ($89) or Ameridroid ($124.95, watch stock) |
| 1 | Cudy WR3000P (MT7981B, PoE powered, 512MB/128MB NAND, OpenWrt supported) | $70-90 | Amazon B0FG3D2SDY |
| 1 | 8-position DIP switch, through-hole | $2 | any |
| 1 | 24C02 I2C EEPROM breakout | $3 | any |
| 1 | MikroBUS proto board | $5 | Mikroe or Amazon |
| 1 | 802.3at PoE injector, gigabit | $20 | Amazon |
| 1 | Dupont jumper wire kit | $7 | Amazon |
No USB-TTL adapter: the One has USB-C console built in.
