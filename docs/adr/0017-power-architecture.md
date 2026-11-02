# ADR 0017: Power. PoE in only, PoE passthrough out, USB-C PD fallback. No mains inside the unit.
Date: 2026-11-02 | Status: Accepted

## Decision
- Primary and only mandatory input: 802.3at PoE on the uplink RJ45 (25.5 W budget).
- Output: one 802.3af class 3 PoE passthrough port (ADR 0009).
- Secondary input: USB-C PD, 15 V profile, PD sink controller on the carrier. Bench use and cabins with USB-C sockets.
- No AC mains inside the enclosure. No 12 V barrel jack. No battery.
- Rooms without PoE infrastructure are served by a certified 30 W 802.3at wall-plug injector shipped in the box with a 1 m patch cable. Interchangeable plug heads for 120/230 V regions.

## Why
- Mains inside the unit means IEC 62368-1 safety certification, isolation and hi-pot testing, a heavier and larger case, and region-specific variants. The injector is already certified and already available in every plug standard.
- One power path on the board: one DC-DC design, one thermal profile, one test. The unit is identical for a PoE hotel, an outlet-only motel, and a cruise cabin.

## Consequences
- Carrier revA: PoE PD controller, isolated flyback or forward DC-DC (25.5 W in), PSE controller for passthrough, USB-C PD sink. Power budget: SoC + radios ~8 W, nRF ~0.1 W, passthrough up to 15.4 W, margin ~2 W.
- Box contents become a SKU option: "PoE" (unit + cable) and "Outlet" (unit + cable + injector). Same unit.
- Backlog: CELL-051 injector sourcing (UL/CE listed, 30 W, plug heads), CELL-052 power budget and thermal check at full passthrough load.
