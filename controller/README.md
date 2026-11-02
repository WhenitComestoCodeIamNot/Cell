# controller/
Fleet controller. Go, single binary, embeds `app/dist`. ADR 0011.
- `go run ./cmd/cellctl serve --db sqlite://cell.db` single-property on-prem
- `go run ./cmd/cellctl serve --db postgres://...` cloud
APIs: REST+WS for UI; mTLS gRPC `cell.v1` for units (enroll, heartbeat, config pull, OTA stage/ack, telemetry).
Canary logic per VERSIONING.md: 5% of a site for 48 h, auto-rollback on regression.
