# Logging and Alerting v0

## Device side (cell-agent)
- Structured events (JSON lines): boot, shutdown, power source change, join attempt (success/fail, code match), role change, mesh re-parent (old, new, metric), client roam steer (client, target), OTA stage/verify/install/rollback, HW check result, config version change, temperature threshold, battery state, controller reachability.
- Metrics every 60 s: upstream RSSI, mesh neighbours and metrics, hop count, client count, per-client RSSI, throughput, CPU, mem, temp, power source, battery %, uptime.
- Storage: ring buffer in a dedicated flash partition, 4 MB, survives reboot and power loss. Last-gasp flush on input loss (ADR 0018).
- Transport: batched to controller over the existing mTLS channel every 60 s, store-and-forward while unreachable, oldest dropped first only when the buffer is full. Satellite mode: compressed, batched to the OTA windows, events still sent immediately.
- Local debug: `cell-agent logs` over dropbear for an installer on site, no web UI.

## Controller side
- Ingest, index, and retain events and metrics per unit, Cell, site, org. Retention 13 months metrics (downsampled after 30 days), 13 months events, audit log 7 years.
- Search by unit, site, time, event type, client MAC.
- Audit log (separate stream): every console action, who, when, source IP, before/after for config changes. Exportable CSV/JSON.

## Alert rules shipped by default
| Rule | Condition | Severity |
|---|---|---|
| Unit offline | No heartbeat 5 min | High |
| Site event | >20% of a site's units offline within 2 min, collapses into one alert | Critical |
| Weak upstream | RSSI < -75 dBm for 15 min | Medium |
| Reboot loop | 3 reboots in 30 min | High |
| HW rev mismatch | Boot halted, LED code 3 | High |
| OTA failure | Install failed or rolled back | High |
| Canary regression | Throughput, reboots or drops outside band during canary | High, auto-rollback |
| Temperature | > 70 C board or > 45 C pack | High |
| Mesh storm | > 5 re-parents in 10 min on one unit | Medium |
| Wrong-code joins | 5 failed PAKE attempts, window closed | Medium |
| On battery | Running on battery > 1 min | Medium; Critical at 20% |
| Config drift | Unit config version behind site for 1 h | Low |
Rules are editable per org and per site: thresholds, severity, routing, quiet hours, escalation after N minutes unacknowledged.

## Channels
Email, SMS, Slack webhook, Microsoft Teams webhook, PagerDuty, Opsgenie, generic webhook (JSON), daily digest email. Per-site routing; test button per channel.

## Backlog
CELL-058 device event schema + ring buffer, CELL-059 controller ingest + search, CELL-060 alert rules engine + channels, CELL-061 audit log + export, CELL-062 Alerts and Audit log pages in the console.
