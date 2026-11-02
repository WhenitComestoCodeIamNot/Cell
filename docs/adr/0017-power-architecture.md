# ADR 0017: Power. Three inputs on one 48 V rail: PoE, built-in universal mains, USB-C PD.
Date: 2026-11-02 | Status: Accepted (revised same day: mains moved from "injector in the box" to built in)

## Decision
- **PoE in**: 802.3at on the uplink RJ45, 25.5 W budget.
- **Mains in**: pre-certified encapsulated AC-DC module, Mean Well IRM-30-48 class (85 to 264 V AC universal, 48 V DC, 30 W, UL/IEC 62368-1 recognised). IEC C8 (figure-8) inlet on the rear edge; region is the cord in the box, not a unit variant.
- **USB-C PD in**: 15 V profile, PD sink controller. Bench and cabins with USB-C. Passthrough PoE is limited or disabled on USB-C power.
- All three land on one 48 V rail with ideal-diode ORing; priority mains > PoE > USB-C. Downstream DC-DC and PSE passthrough are one design regardless of source.
- Output: one 802.3af class 3 PoE passthrough port (ADR 0009), full load available on mains or PoE.
- No battery. No 12 V barrel.

## Why
- The property decides how the room is wired, not us. PoE closet, wall outlet, or USB-C socket all work with the same unit and nothing extra in the box but a cord.
- The encapsulated module keeps isolation, creepage and hi-pot inside an already-certified part. End-product safety evaluation still required, but scope and cost drop sharply (est. $3k to $6k vs $8k to $15k for a discrete mains design).

## Consequences
- Carrier revA: mains keep-out zone and slot for the IRM module, C8 inlet, PoE PD controller, PD sink, ORing, isolated DC-DC, PSE. Board grows roughly 15 mm in one axis; case follows.
- Enclosure (CELL-014): metal shell with the C8 cutout; mains section shielded from the RF side.
- Thermal: 30 W in a sealed metal shell needs a check at full passthrough load (CELL-052).
- Backlog: CELL-053 end-product safety evaluation (IEC 62368-1) budget and lab selection; CELL-051 repurposed to region cord kits.
