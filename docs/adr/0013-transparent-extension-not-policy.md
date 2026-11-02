# ADR 0013: Cell extends the property's WiFi transparently. Network policy belongs to the upstream AP.
Date: 2026-11-02 | Status: Accepted | Narrows MARKET.md s7 and ADR 0009

## Decision
- Cell is a transparent in-room extension of the existing WiFi. It does not implement rate limits, per-room bandwidth caps, VLAN policy, captive portals, RADIUS, or per-guest keys. Cisco, Aruba, Ruckus and the rest do that well on the AP and controller the property already owns.
- Units bridge in 4-address (WDS) mode: the upstream AP sees each guest device's real MAC. Upstream isolation, VLAN assignment and authentication apply to that device exactly as if it had associated with the AP directly.
- Guest-facing SSID and key are mirrored from upstream by the Seed (the installer enters them once, or the Seed learns them from the network it is told to join). Where the property runs per-guest PSK, that is the AP's feature; Cell passes it through unchanged.
- What Cell owns: full-speed extension (dual radio, ADR 0002), zero-config join (ADR 0003), fleet visibility and health (controller), signed OTA, PoE in and passthrough, the IoT gateway radio.
- Bandwidth appears in our product only as "we are not the bottleneck": per-hop throughput telemetry and a warning when a chain gets too long.

## Removed from scope
- CELL-025 per-room caps and isolation: dropped. Isolation is inherited from upstream via 4-addr bridging.
- CELL-027 per-room PSK: dropped. Pass-through only.
- Site config page: shrinks to upstream SSID and key, backhaul channel plan, TX power cap, naming scheme, satellite mode.

## Why
- Every policy feature we add is a setting an installer has to understand and a place we can be wrong. The pitch is "set the code, press the button".
- Properties already pay for a controller that does this. Duplicating it makes us a competitor to their AP vendor instead of an add-on that makes it reach the room.
