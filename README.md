# Cell

Brand-agnostic, low-cost WiFi extender for rooms where an AP can't go: hotel rooms, cruise cabins, motels.
Set the DIP code, press the button, it joins the Cell.

## Vocabulary
- **Cell**: all devices sharing one DIP code at one site.
- **Seed**: a configured device marked to propagate config. One-way: Seed pushes, joiner pulls.
- **Node**: a member of a Cell that is not a Seed.
- **Join window**: 10 minutes after the Seed button is pressed (or app tap). Nothing joins outside it.

## Repo layout
```
docs/adr/        Architecture Decision Records. Every decision lives here, numbered, never deleted.
docs/specs/      Protocol and behaviour specs (join protocol, naming, OTA).
docs/VERSIONING.md  External vs internal versioning policy.
docs/COMPAT.md   Compatibility matrix. CI refuses builds not listed here.
firmware/        OpenWrt ImageBuilder config, packages, cell-agent.
hardware/        KiCad carrier board, enclosure (K2 prints), BOM per HW rev.
controller/      Fleet controller (OTA staging, telemetry, per-site config).
app/             Installer app.
sprints/         Sprint plans and retros. BACKLOG.md is the single backlog.
.github/         CI: firmware build, HW rev gate, release tagging.
```

## Rules
1. No decision without an ADR. If it changed, write a new ADR that supersedes the old one.
2. No firmware build ships unless its HW rev pair is in COMPAT.md.
3. Every PR links a backlog item (CELL-nnn).
4. Tags: `fw-v1.2.3`, `hw-revB`, `ctl-v0.4.0`, `app-v0.2.0`, `product-v1`.
