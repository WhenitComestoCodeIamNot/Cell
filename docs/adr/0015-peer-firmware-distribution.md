# ADR 0015: Firmware is distributed peer to peer across the Cell
Date: 2026-11-02 | Status: Accepted

## Decision
- Controller stages an image to one or more units (default: the Seed, or whatever canary set is chosen). Every unit that holds a verified image serves it over the mesh backhaul (local HTTP, signed manifest). Units pull from the nearest holder, controller only if no peer has it.
- A unit installs only an image whose usign signature verifies against the release key baked into the current firmware, regardless of source. Peers cannot inject firmware.
- A/B install and auto-rollback (ADR 0004) unchanged. Canary and promotion decisions remain in the controller; peers distribute, they do not decide.
- Bandwidth-aware: distribution runs at low priority on the mesh, pauses when guest traffic is high, and respects satellite mode windows (CELL-026).

## Why
- A site downloads each release once from the internet instead of once per room. On a ship with a metered satellite link this is the difference between a 20 MB and a 4 GB update.
- Units that lose controller reachability still update from neighbours when it returns.

## Consequences
- cell-agent gains: image cache, peer announce over mesh (mDNS-style), fetch with resume, verify, hand to sysupgrade.
- Controller gains: "seed this image to N units then let it spread" as the default rollout mode; per-unit "got it from" shown in the rollout view.
- Backlog: CELL-045 peer image serve/fetch, CELL-046 rollout UI shows propagation.
