# ADR 0019: Online topology and surge protection on every input
Date: 2026-11-02 | Status: Accepted | Extends ADR 0017, 0018

## Decision
- Online (double-conversion) topology: every input charges the 12 V bus; the 4S LiFePO4 pack sits directly on that bus; all electronics run from DC-DC off the bus. The load never sees input transients directly. Brownouts, flicker and generator noise become charger ripple.
- Surge and transient protection:
  - Mains inlet: fuse, MOV, gas discharge tube, common-mode choke, NTC inrush limiter, ahead of the encapsulated AC-DC module. Target IEC 61000-4-5: 4 kV line to earth, 2 kV line to line.
  - Both RJ45: 1500 V isolation magnetics plus TVS arrays on all four pairs, 2 kV surge, 8 kV contact / 15 kV air ESD. PoE lines protected on the PD and PSE sides.
  - USB-C: TVS on VBUS, CC and data.
  - Antenna connectors: ESD diodes.
- Power-quality telemetry: input voltage sampled, brownout and input-switch events logged with timestamps; counters per unit surface in the console so a bad room circuit shows up as a pattern.

## Why
- A small wall unit at the end of long cable runs, on hotel and ship power, is the exact profile that dies from surges. Protection is a few dollars; a truck roll is not.
- Universal-input mains module (85 to 264 V) plus the online topology covers ship generator variation and brownout-prone regions without unit variants.

## Consequences
- Carrier revA gains a protection section on each input edge and an input-voltage sense line to the SoC ADC or a small monitor IC.
- EMC pre-compliance test (surge, ESD, EFT) added to the bring-up plan before certification (CELL-063).
- Backlog: CELL-063 EMC pre-compliance plan, CELL-064 power-quality telemetry and events.
