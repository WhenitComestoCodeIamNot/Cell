# ADR 0014: Self-healing 802.11s mesh backhaul; standards-based roaming across Cells and the property's APs
Date: 2026-11-02 | Status: Accepted | Amends ADR 0003 (Seed is a config role, not a topology role)

## Decision
### Backhaul
- Backhaul radio runs **802.11s mesh** (mt76 supports it) with HWMP airtime metric. Each unit continuously picks the best path to a wired-side gateway: another Cell, or any Cell that has direct upstream to the property AP. Re-route on degradation in about 1 s, with hysteresis (min 6 dB or 20% airtime improvement, 30 s hold) to prevent flapping.
- Any unit with good upstream signal to the property AP can act as a gateway, not only the Seed. Gateway count per Cell is capped by config (default 3) to avoid everyone hitting the AP.
- Seed remains the config propagator and the join window owner only.
- Dual radio unchanged (ADR 0002): mesh on one band, guest AP on the other.

### Roaming
- Guest SSID is identical on every Cell and matches the property SSID when the property allows it (mirrored at join). One flat L2 via 4-addr bridging (ADR 0013), so a roam is a reassociation, never a re-login.
- **802.11k** neighbour reports on every Cell include other Cells AND the property's APs (learned by scanning).
- **802.11v** BSS transition: a Cell steers a client toward a better Cell or a property AP when the client's RSSI to us drops below a threshold and a better candidate exists. Cell-to-Cell steering uses usteer-style coordination over the mesh.
- **802.11r** fast transition between Cell units within one Cell (shared mobility domain and keys). Cell to property AP is a standard reassociation (100 to 300 ms); cross-vendor FT is not available without the AP vendor's key distribution. Documented limit.
- The client always makes the final roaming decision. We make the right choice visible and the handoff fast; we do not pretend to control the phone.

## Consequences
- Join protocol: after join, a Node joins the mesh (mesh ID and key come from the Seed) instead of associating to the Seed as a WDS station.
- Topology view (CELL-037) shows live mesh paths and gateways, not a static tree.
- New backlog: CELL-041 mesh backhaul, CELL-042 k/v/r, CELL-043 steering daemon, CELL-044 gateway election and cap.
- Risk: 802.11s on mt76 is solid in OpenWrt but less battle-tested than WDS. Sprint 1 keeps WDS as the fallback if mesh throughput disappoints on the bench.
