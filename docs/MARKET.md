# Market, Competitors, Differentiators
Date: 2026-11-02 | Owner: product | Feeds ADR 0008 (IP strategy, to be written)

## 1. Who we are actually competing with

Cell Pro sits between two categories that don't talk to each other: consumer range extenders ($30 to $120, zero fleet management) and hospitality in-wall APs ($100 to $600 plus controller licences, one cable run per room, IT-installed).

| Product | Street price | Radio | Power | Mgmt | Setup | Notes |
|---|---|---|---|---|---|---|
| Ruckus H350 | $595 (CDW) | WiFi 6 2x2, BLE/Zigbee | PoE or DC | SmartZone / Cloud / Unleashed, licence | Controller adoption | The hospitality incumbent. Wall-plate, 2 to 3 GbE ports, 512 clients |
| Aruba AP-505H | ~$400 to $500 | WiFi 6 2x2 | PoE | Aruba Central, licence | Controller adoption | Same class as H350 |
| Ubiquiti U6 In-Wall | $179 | WiFi 6, 6 streams | PoE+ in, 1 PoE out | UniFi controller, no licence | Adopt in UniFi | Price leader in the pro tier. Needs a UniFi console on site |
| TP-Link Omada EAP615-Wall | ~$100 | WiFi 6 AX1800 | PoE in, 1 PoE passthrough | Omada SDN, cloud ZTP | Zero-touch via cloud | Our closest price competitor. Still needs a cable to every room |
| Grandstream GWN7624 | ~$120 | WiFi 6 | PoE | GWN.Cloud free | Cloud | Budget hospitality |
| TP-Link RE series / Netgear EX | $30 to $120 | WiFi 5/6, single or dual | Wall wart | App, no fleet | WPS button | Consumer. No fleet, no isolation, no inventory |
| eero / Deco / Orbi mesh | $70 to $200 per node | Dual or tri-band | Wall wart | App, cloud, per-home | App | Great UX, built for one household, not 200 rooms |

What every pro option above has in common: **a cable to every room**. That is the thing hotels built in the 1990s don't have, and cruise cabins have steel bulkheads and no spare conduit. Consumer extenders solve the cable problem and fail at everything else.

## 2. What a traditional extender has that Cell must keep
- Works with any upstream WiFi. No vendor lock to the host AP. Non-negotiable; it's the whole brand-agnostic premise.
- Dual radio so the hop doesn't halve throughput (ADR 0002). Cheap extenders cut this corner; we don't.
- A wired port for the TV / set-top box. Hotels expect it (H350, EAP615 all have it).
- Signal strength indicator at install time. Ours is in the app, with a placement score, not a 3-LED bar.
- WPA2/WPA3 client support toward the host network, including captive-portal-free PSK join.
- Compact, outlet-adjacent, no external antennas.

## 3. What Cell has that traditional extenders don't
- Fleet identity: every unit has a name (SITE-F03-R312), a site, a role, a firmware version, and shows up in one controller view.
- 4-address bridging so the upstream AP's isolation, VLAN and auth apply to every guest device as if it were on the AP directly. Consumer extenders hide clients behind one MAC and break all of that.
- Signed, A/B, canaried OTA. Extenders update when a guest clicks a button in a web UI nobody opens.
- Hardware revision self-reporting at boot, so the fleet view knows which board is where (VERSIONING.md).
- PoE in (Pro). Extenders are wall-wart only.

## 4. What the pro in-wall APs have that Cell doesn't (and whether to care)
| Feature | Care? | Why |
|---|---|---|
| Multi-port switch with PoE passthrough | Later (hw-revB) | Hotels power IP phones and STBs from the room AP. Adds $6 to $9 COGS. Revisit after 500 units |
| IoT radio (BLE / Zigbee) | Yes, Pro v2 | Smart locks, thermostats, minibar sensors. The MT7981 has no IoT radio; a $2 BLE module on the carrier gets us there. Big hotel ask |
| 512+ concurrent clients | No | A room has 2 to 6 devices. Spec sheet vanity |
| Enterprise RADIUS / 802.1X / PPSK | No, pass through | The upstream AP does this. Cell bridges transparently so it keeps working (ADR 0013) |
| Controller licence revenue | Yes, differently | They charge per AP per year. We charge per room per month and the hardware is cheap. Same money, framed as opex the GM already approves |
| Lifetime warranty (TP-Link) | Match it | Cheap to promise when the shell is metal and the unit has no moving parts |

## 5. Differentiators that put us in front

### Tier 1: must-haves that nobody in the table does
1. **No cable to the room.** Pro in-wall APs all need one. We are the only pro-grade, fleet-managed device that installs where there is only an outlet.
2. **Physical code join (DIP + button + window), one-way Seed propagation.** No portal, no controller adoption, no app typing. Installer sets a code, presses a button, walks to the next room. 90 seconds to guest WiFi per room. This is the demo that closes hotel deals.
3. **Config flows one way, and the boundary is physical.** A joiner can never poison the Seed. Security story a hotel IT manager understands in one sentence.
4. **Brand-agnostic upstream.** Drop in on Ruckus, Cisco, Aruba, Starlink, whatever the property already has. No forklift.

### Tier 2: things the big players do badly that we do by default
5. **Zero-licence fleet controller**, or a flat per-room price with OTA, canary, telemetry, and naming included. No per-AP licence tiers.
6. **Hardware rev + firmware compatibility gate in CI.** Not a customer feature, but it's why a 2029 unit and a 2026 unit sit in the same fleet without surprises. Competitors handle this with EOL notices.
7. **Cruise-ready.** Steel bulkheads, no conduit, Starlink or VSAT upstream with high latency and metered bandwidth. Per-cabin bandwidth caps and a satellite-aware backhaul mode (fewer, larger OTA windows; local caching of the welcome page) are features nobody ships for cabins today.

## 6. Patent candidates (not legal advice; file a provisional, then get counsel to run a real search)
Prior art is thick in this space. BT (WO2018122076) covers auto-provisioning from a pairing AP via a provisioning server. Many filings cover WPS-style button pairing, PAKE from a PIN, and mesh self-configuration. The claims that look novel enough to pursue are the specific **combinations**, not the parts:

| # | Candidate claim | What makes it arguably novel | Risk |
|---|---|---|---|
| P1 | Group membership defined by a physical multi-position switch, where the switch value is used only as a PAKE password and never transmitted, combined with a time-boxed join window opened by a physical actuator on the propagating device | Physical code + PAKE + window + explicit propagator role in one claim | Each piece exists separately. Novelty is in the combination and the installer workflow |
| P2 | Strictly one-way configuration propagation from a designated Seed, enforced by role bits in the same physical switch, with promotion of a Node to Seed logged to a fleet controller | Role in hardware, directionality as a protocol invariant | Mesh systems have "root" nodes; the hardware-enforced role and the audit trail are the distinguishing parts |
| P3 | Boot-time hardware revision attestation by independent means (strap resistors plus EEPROM) with halt-on-mismatch, feeding a server-side compatibility gate that refuses to stage firmware for unknown pairs | Attestation + CI gate as a closed loop | Likely too close to standard manufacturing practice. Weakest of the four |
| P4 | Satellite-aware backhaul mode for room extenders: detects high-latency, metered upstream and switches OTA scheduling, caching and per-room caps as a unit | Cruise and remote-lodge specific, nobody has productised it | Novel use case; check Starlink / maritime filings first |

Recommendation: file **one provisional** covering P1 and P2 together before any public demo or sale (US grace period is 12 months but foreign rights die on public disclosure). Budget $2k to $4k for the provisional with counsel; $10k to $15k for the non-provisional a year later. Track as CELL-024.

## 7. Must-have list for Pro v1 (launch blockers)
- DIP + button + 10 min window join, under 90 s to guest WiFi
- One-way Seed, Node promotion in app, logged
- Dual radio, WiFi 6, 802.3at PoE in, one PoE passthrough port, USB-C fallback
- BLE 5 + 802.15.4 IoT gateway (nRF52840)
- Transparent 4-addr bridge: upstream isolation, VLAN and auth pass through unchanged (ADR 0013)
- Signed A/B OTA with canary and auto-rollback, distributed peer to peer across the site (one download per site)
- Self-healing mesh backhaul and standards-based roaming (802.11k/v/r) across Cells and the property's own APs
- Fleet view: name, site, role, hw-rev, fw, RSSI to upstream, clients
- Coverage map per floor: signal heat, topology, per-device view, editable layout or uploaded floor plan
- Brand-agnostic upstream, WPA2/WPA3 PSK
- Metal shell, lifetime warranty
- One wired port for the TV

## 8. Fast follows (v1.x, not launch blockers)
Per ADR 0009 the IoT radio and PoE passthrough are in v1 / hw-revA. PPSK dropped per ADR 0013. Remaining:
- Satellite-aware mode (cruise)
- EasyMesh interop as a checkbox, not a dependency

## Sources
- Ubiquiti U6 In-Wall store page, $179, PoE+ in, PoE out: store.ui.com
- Ruckus H350 product page and CDW listing, $595, BLE/Zigbee, 512 clients
- TP-Link Omada EAP615-Wall, Walmart listing ~$98, PoE passthrough, cloud ZTP
- OpenWrt forum and Cudy product pages for MT7981 hardware baseline
- WO2018122076A1 (BT), auto-provisioning via pairing AP, Google Patents
