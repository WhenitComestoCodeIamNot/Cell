# ADR 0003: DIP code defines the Cell; join is one-way from Seed
Date: 2026-11-02 | Status: Accepted

## Decision
- 8-position DIP. Switches 1-6 = Cell code (64 codes per site; combine with site key from Seed for uniqueness). Switch 7 = Seed role. Switch 8 ON at boot = factory reset.
- A device marked Seed pushes config. A joiner only pulls. Config never flows upstream.
- Join accepted only inside a 10-minute window opened by the Seed button or app.
- DIP code is treated as a PIN inside a PAKE handshake (SAE/Dragonfly or SPAKE2). Code never transmitted.

## Why
Installer sets a code and presses a button. No typing, no portal. Physical access to the Seed is the security boundary, same as a hotel room safe.

## Consequences
- A Node can be promoted to Seed in the app. Promotion is logged to controller.
- Two Seeds in one Cell: newest config wins by monotonic version counter. Documented in specs/join-protocol.md.
