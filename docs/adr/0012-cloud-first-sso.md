# ADR 0012: Cloud-first controller, reached from the main site, SSO sign-in
Date: 2026-11-02 | Status: Accepted | Extends ADR 0011

## Decision
- The fleet controller is hosted by us and reachable from anywhere at a subdomain of the product site (working: `app.<celldomain>`). Browser is the primary client; the PWA and store apps are the same UI.
- Sign-in is SSO via OIDC: Microsoft Entra, Google Workspace, Okta, plus email magic-link for small properties without an IdP. No passwords stored by us.
- Multi-tenant from day one: Org -> Sites -> Cells -> Units. Roles per site: Owner, Admin, Installer (join window, naming, promote), Viewer. Installer role is what a contractor gets for one day.
- Units reach the controller outbound only (mTLS gRPC over 443). Nothing inbound to a hotel network. Works behind any NAT, satellite, or captive upstream.
- On-prem mode (SQLite, single binary) remains for cruise lines and no-cloud policies. Same binary, `--mode onprem`.

## Consequences
- Controller gets: OIDC client, tenant model, RBAC middleware, audit log (every join, promotion, OTA stage, config change, who and when).
- Hosting: start on a single VPS with Postgres and Caddy for TLS; move to managed Postgres and two regions when a second continent signs. Budget line, not a design constraint (ADR 0010).
- Status page and uptime SLO published once paying sites exist.
- Backlog: CELL-033 OIDC + RBAC, CELL-034 tenant model + audit log, CELL-035 hosting + domain + TLS.
