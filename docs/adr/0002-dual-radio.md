# ADR 0002: Dual radio is mandatory for mesh SKUs
Date: 2026-11-02 | Status: Accepted

## Decision
All SKUs that support chaining ship dual radio: one band for guest AP, one for backhaul to the upstream AP and peer Nodes.

## Why
Single radio halves throughput per hop. Two hops in a hallway = 25% of source speed. Hotels will measure this.

## Consequences
- Kills the $20 tier at launch (see ADR 0005).
- Backhaul channel plan is pushed by the Seed, not chosen per device.
