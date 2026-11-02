# Join Protocol v0 (draft)

## Radios, which does what
- **Unit to unit (join, config, backhaul): WiFi only.** The joiner finds the Seed on the backhaul band. BLE is not used for joining: range is too short for room-to-room and WiFi is the link they keep anyway.
- **Phone to unit: Bluetooth (nRF52840).** Only for a unit with no network yet (the first Seed at a site, or a unit that lost upstream) and for on-site troubleshooting. Everything else from the app goes through the controller.
- **Locks, sensors, thermostats: BLE / 802.15.4 via the nRF52840**, after the unit is up.

## Actors
Seed (S), Joiner (J). Both have DIP code `c` (6 bits). S holds site key `K_site`, config version `v`.

## Sequence
1. J boots, reads DIP. If sw8 ON → factory reset, halt. If sw7 ON → become Seed candidate, wait for app provisioning.
2. J scans backhaul band for beacons carrying IE `CELL-JOIN` with matching code hash `H(c || salt)`. Salt rotates per join window so codes cannot be replayed from old captures.
3. S only transmits `CELL-JOIN` beacons while join window open (600 s after button/app).
4. J ↔ S run PAKE (SPAKE2, password = c || site_hint). Derive session key `K_s`.
5. S sends over `K_s`: `K_site`, SSID/PSK (WPA3), guest VLAN id, backhaul channel plan, TX power cap, controller URL + per-device enrollment token, naming ordinal, current FW version + image URL if J is behind.
6. J ACKs, stores config (including mesh ID and mesh key), reboots into Node role and joins the 802.11s backhaul mesh (ADR 0014); it no longer associates to S as a WDS station. S logs join to controller with J's MAC and assigned name.
7. Rate limit: 1 PAKE attempt per MAC per 60 s. 5 failures → S closes window and alerts app.

## Naming
`<SITECODE>-F<floor>-R<room>` suggested by Seed from ordinal; installer confirms or edits in app before step 6 completes.

## Config propagation after join
Nodes poll Seed (or controller if reachable) every 15 min. Higher `v` wins. Nodes never push.

## Open questions (track in BACKLOG as CELL-010..014)
- SPAKE2 vs SAE: SAE already in hostapd, less code. Lean SAE.
- Does a Seed also relay guest traffic, or is Seed a pure config role? Lean: Seed is also a Node.
