# ADR 0006: Focus on the $100 Pro unit at 65% gross margin
Date: 2026-11-02 | Status: Accepted (price amended to $129 by ADR 0009) | Supersedes launch scope in ADR 0005

## Decision
Launch one SKU: Cell Pro, $100 MSRP, 65% gross margin floor. Standard ($50) and Lite ($20) are parked.

## Margin math
- 65% GM on $100 = COGS ceiling **$35** fully landed (board, SoM, PoE, shell, packaging, test, freight, duty).
- Target build: MT7981 SoM ($11-13 @1k), carrier PCB + SMT ($4), 802.3at PoE PD + DC-DC ($3.50), metal shell ($5 @1k, $2.50 @5k), DIP/button/LED/connectors ($1.20), packaging + QC + freight ($4). Est. **$29-31 @1k**, leaving $4-6 headroom for yield loss and returns.
- Reseller channel: 25% margin to them means we sell at $75 and GM drops to 53%. Direct-only until volume justifies channel, or raise channel MSRP to $125.

## Why Pro first
- Hotels buy PoE. One cable, no wall wart, powered from the closet switch.
- $100 is under the capex approval line at most properties and a third of Ubiquiti/Ruckus in-wall.
- Metal shell solves thermal and makes the unit feel like infrastructure, not a gadget.

## Consequences
- hw-revA is now a PoE board. CELL-013 rewritten.
- USB-C stays as a bench/cruise-cabin power fallback, no cost impact.
- COMPAT.md tier column added.
