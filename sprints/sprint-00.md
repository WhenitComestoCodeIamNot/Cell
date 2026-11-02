# Sprint 0 (Nov 3 to Nov 16, 2026): Foundation
Goal: CI image boots on the WR3000P bench unit and reports version; module chosen (CELL-048); carrier revA schematic and outline frozen (CELL-050) so the K2 case can start. ADR 0016.

Committed: CELL-002, CELL-015, CELL-048, CELL-013 (schematic), CELL-050
Stretch: CELL-004

Definition of done: tag `fw-v0.1.0` exists, image flashed on bench, `cat /etc/cell-release` shows version + hw-revA.

Buy list (CELL-022), per ADR 0016. About $300.
| Qty | Item | Est. | Where |
|---|---|---|---|
| 1 | Hi-Link HLK-RM65 dev kit (module + baseboard, schematics, PCB reference) | ~$75 | AliExpress, Hi-Link official store |
| 1 | Cudy WR3000P, bench tool only, mainline OpenWrt, PoE powered | $70-90 | Amazon B0FG3D2SDY |
| 1 | PoE+ 802.3at gigabit switch, 5-8 port, unmanaged | $40-60 | Amazon |
| 2 | Seeed XIAO nRF52840 | $10-15 ea | Amazon |
| 1 | 8-position DIP switch pack | $6 | Amazon |
| 2 | AT24C02 I2C EEPROM breakout | $6 ea | Amazon |
| 1 | Dupont jumper kit | $7 | Amazon |
| 2 | Cat6 patch cables, 3 ft | $8 | Amazon |
| 1 | USB-TTL 3.3 V serial adapter (module console) | $8 | Amazon |
If SOM-7981 wins CELL-048, order its kit instead of the RM65 kit.
