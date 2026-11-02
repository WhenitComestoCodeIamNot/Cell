# Sprint 0 (Nov 3 to Nov 16, 2026): Foundation
Goal: CI image boots on the WR3000P bench unit and reports version; module chosen (CELL-048); carrier revA schematic and outline frozen (CELL-050) so the K2 case can start. ADR 0016.

Committed: CELL-002, CELL-015, CELL-048, CELL-013 (schematic), CELL-050
Stretch: CELL-004

Definition of done: tag `fw-v0.1.0` exists, image flashed on bench, `cat /etc/cell-release` shows version + hw-revA.

Buy list (CELL-022), per ADR 0016. About $300 plus power bench parts below, about $430 total.
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

Power bench parts (ADR 0017, 0018, 0019; 12 V bus), about $145:
| Qty | Item | Est. | Where |
|---|---|---|---|
| 1 | Mean Well IRM-30-12 encapsulated AC-DC module | $15 | Mouser, Amazon |
| 1 | IEC C8 panel inlet + C7 cord | $10 | Amazon |
| 4 | LiFePO4 18650, 3.2 V 1500 mAh | $28 | Amazon |
| 1 | 4S LiFePO4 BMS board (12.8 V) + 4x18650 holder | $12 | Amazon |
| 2 | 5.5 V 1 F supercapacitor | $6 | Amazon |
| 1 | Bench PSU 0-60 V 5 A adjustable | $60-90 | Amazon |
| 1 | USB-C PD trigger board, 12 V | $8 | Amazon |
Surge parts (TVS, MOV, GDT, chokes), charger IC and ORing controller go on the carrier and are placed by JLCPCB; not hand-bought.
