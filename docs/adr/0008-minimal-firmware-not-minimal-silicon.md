# ADR 0008: Fit-to-purpose is done in firmware and the carrier board, not by picking a smaller SoC
Date: 2026-11-02 | Status: Accepted

## Context
Concern raised: the MT7981B dev boards are full routers with ports, USB, M.2 and a stock firmware full of features Cell will never use. Why not build from the ground up?

## Decision
- Stay on MT7981B (Filogic 820) as the SoC. Unused blocks (second Ethernet MAC, USB, PCIe, 2.5G MAC) stay unpowered. Estimated dark-silicon cost: $1.50 to $2.50 per unit.
- The dev boards (OpenWrt One, Cudy WR3000P) are Sprint 0 and 1 tools only. Production is SoM on our carrier (ADR 0001) with exactly: PoE PD, one RJ45, DIP, button, one LED, USB-C fallback.
- "Ground up" is delivered in firmware. CELL-002 produces a minimal profile: kernel, mt76 driver, hostapd, wpa_supplicant, cell-agent, dropbear (signed-key only), minimal firewall. No LuCI, no DHCP server, no PPPoE, no VPN packages, no shell on the guest side. Target under 10 MB. Nothing not on the list is installable without a signed image.

## Rejected
- Single-radio SoC (MT7628 class): breaks ADR 0002.
- Microcontroller WiFi (ESP32-C6 class): throughput and concurrency unfit for an extender.
- Qualcomm IPQ: NDA and volume gates, no mainline.
- Custom ASIC: $5M+ and years. Not a conversation until unit volume is six figures.

## Later
- hw-revC: bare MT7981B with our own RF layout instead of a SoM once certification budget exists. Saves $4 to $6 of module premium at the cost of intentional-radiator testing.
