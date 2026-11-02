# ADR 0010: Capability first. Cost is tracked, not a design gate.
Date: 2026-11-02 | Status: Accepted | Amends ADR 0006 and 0009

## Decision
- Design decisions are made on capability and quality. The 65% GM floor and $45 COGS ceiling are no longer gates on hardware or firmware scope.
- CELL-020 COGS tracker stays, as information. It reports landed cost per HW rev at 100 / 1k / 5k units. It does not block anything.
- MSRP is set at launch from the finished BOM and the competitive table in MARKET.md, not the other way round.
- Rationale: the unit is small, the parts are commodity, and volume pricing does the work. Pilot units (first 100) are expected to cost above the eventual run rate.

## Consequences
- ADR 0009's $129 is a placeholder, not a commitment.
- Hardware choices default to the better part when the delta is a few dollars (e.g. 802.3bt PoE input if it unlocks more passthrough power; larger flash for more A/B headroom).
- Sprint planning is driven by the launch-blocker list in MARKET.md s7.
