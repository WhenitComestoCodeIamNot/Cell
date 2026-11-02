# ADR 0007: Sprint 0 dev board is the OpenWrt One; Cudy WR3000 as the cheap second node
Date: 2026-11-02 | Status: Accepted | Closes CELL-001

## Decision
- Primary bench board: **OpenWrt One** (Banana Pi, MT7981B Filogic 820, 1 GB DDR4, 256 MB NAND + 16 MB NOR recovery). Buy 1 kit.
- Second node for join testing: **Cudy WR3000** (same MT7981B, 256 MB RAM, 16 MB NOR, 4x GbE). Buy 1, add a second if Sprint 1 needs three.
- GL.iNet GL-MT3000 is dropped as the reference board. Same SoC, but $90 class, no PoE, only 2 ports, and its stock firmware adds a flashing detour we don't need.

## Why the OpenWrt One
- Same SoC family we chose for Cell Pro (ADR 0001, 0006), so the bench image is the product image minus board quirks.
- **802.3at/af PoE is native** via the included RT5040 module. hw-revA in COMPAT.md moves from "external splitter" to native PoE on day one.
- Official OpenWrt target, maintained by the OpenWrt project itself. ImageBuilder profile exists; no vendor fork, no signed-image games. This is the whole point of CELL-002.
- USB-C console built in (Holtek UART bridge) plus a 3-pin UART header and 10-pin JTAG. No USB-TTL adapter needed.
- Boot-select switch (NAND normal, NOR recovery) and write-protected NOR bootloader. A bad image during CELL-004 A/B work cannot brick it.
- **MikroBUS socket** gives us I2C and GPIO for the DIP switch and 24C02 EEPROM breakout (CELL-003) without soldering to the board.
- M.2 slot is irrelevant to Cell but harmless.

## Why the Cudy WR3000 as node two
- $60, MT7981B, OpenWrt wiki page with a two-step install using Cudy's signed OpenWrt image. Cheapest reliable way to get a second MT7981 radio pair on the bench.
- 16 MB NOR is tight for A/B partitions. Fine for a joiner in Sprint 1; not a candidate for production reference.

## Rejected
- Xiaomi AX3000T (~$50): same SoC, but flash chip varies by batch and the install path is documented as tricky. Not worth bench time.
- Banana Pi BPI-R3 Mini / R4: MT7986/MT7988, more than we need, wrong SoC for the product.

## Consequences
- COMPAT.md hw-revA PoE column: "802.3at native (RT5040)".
- Sprint 0 buy list rewritten. Budget rises to about $200 from $120 because the One kit is $89 to $125 depending on seller and stock. Accepted: it replaces the GL.iNet board, the USB-TTL adapter, and the PoE splitter.
- Open risk: the One has been in and out of stock. If unavailable at order time, buy 2x Cudy WR3000 and keep CELL-003 on a USB-I2C adapter until the One ships.

## Sources
- OpenWrt One launch and specs: cnx-software.com, 2024-10-02 ($89 AliExpress, Banana Pi store, kit includes case, PoE module, antennas, PSU)
- Ameridroid full kit listing: $124.95, PoE module included, out of stock at time of writing
- OpenWrt forum "Interesting low-cost routers 2025": Cudy WR3000 $60, Xiaomi AX3000T ~$50 with install caveats
