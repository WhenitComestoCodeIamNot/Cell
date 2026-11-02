# app/
Fleet management UI and installer app. TypeScript, React, Vite, Tailwind, Capacitor. ADR 0011.
- `npm run dev` browser dev
- `npm run build` static assets, consumed by controller via go:embed
- `npx cap add ios|android` store wrappers (BLE provisioning needs the native wrapper on iOS)
Screens for v1: Sites, Fleet table (name, role, hw-rev, fw, RSSI, clients), Unit detail, Open join window, Promote to Seed, OTA staging and canary, Site config (SSID, PPSK, VLAN, caps).
