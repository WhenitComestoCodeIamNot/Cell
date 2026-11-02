# ADR 0001: Pre-certified SoM on a custom carrier board
Date: 2026-11-02 | Status: Accepted

## Decision
Use a pre-certified MediaTek SoM (MT7981 for $50/$100 tiers, MT7628 if a $20 tier is ever built) on a carrier board designed in KiCad and assembled at JLCPCB.

## Why
Full intentional-radiator FCC/CE testing is $15k to $30k. A modular grant on the SoM drops our obligation to unintentional radiator testing, roughly $2k. Carrier board is where DIP, button, PoE, LED, and enclosure fit live, so that stays ours.

## Consequences
- RF layout is the SoM vendor's problem. We do not touch antenna matching.
- Any SoM swap is a new HW rev and a new ADR.
