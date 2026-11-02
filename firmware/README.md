# firmware/

OpenWrt ImageBuilder based. We never run the full OpenWrt toolchain; we take the official ImageBuilder for `mediatek/filogic`, strip the package list to what Cell needs, overlay `files/`, and sign the result.

```
profiles/<hwrev>.env   One file per HW rev: OpenWrt release, ImageBuilder profile, package list
files/                 Overlay copied into every image (cell-agent, defaults, release file)
ci/                    Scripts used by GitHub Actions
out/                   Build output (gitignored)
```

Build locally: `./ci/build.sh hw-revA` (needs ~4 GB disk, Linux, no root).

## Package policy (ADR 0008)
Included: kernel, mt76 driver, hostapd (WPA3), wpa_supplicant, netifd, uci, procd, dropbear, cell-agent, usign.
Excluded: LuCI, uhttpd, dnsmasq (no DHCP server on a Node), odhcpd, ppp, firewall4 rules beyond the base, any VPN, any USB storage.
Add a package only via PR with a one-line reason in the profile file.
