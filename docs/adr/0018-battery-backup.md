# ADR 0018: RTC hold-up on revA; certified LiFePO4 ride-through pack
Date: 2026-11-02 | Status: Accepted

## Decision
- revA: supercapacitor (or coin cell) backed RTC plus hold-up capacitance for ~300 ms of operation after input loss, enough to flush the log ring buffer and send a power-loss event. Always fitted.
- Ride-through: pre-certified LiFePO4 pack with integrated protection (IEC 62133 and UN38.3 already carried by the pack vendor), ~10 to 15 Wh, 4S configuration, 12.8 V nominal, sitting directly on the 12 V bus (no boost); charged by a 4S LiFePO4 charger IC from the ORed inputs. Modes: full operation ~60 min at 8 W; low-power mode (guest radio off, mesh and controller heartbeat on) several hours. Fitted on revA; may be a depopulated option later if a customer wants a battery-free SKU.
- LiFePO4 over Li-ion: no swelling, no thermal runaway in a sealed wall-mounted metal shell, tolerates continuous float for years, wider temperature range.
- The unit reports power source (mains, PoE, USB-C, battery) and battery health as telemetry; "on battery" is an alert.

## Why
- Clock and log continuity across any outage is cheap and avoids wrong timestamps and lost evidence.
- Ride-through gives precise outage reporting, instant recovery with correct state, and keeps the mesh alive through brownouts. Value is limited when the property's switch and APs are also down; this is known and accepted.

## Consequences
- Carrier revA: charger IC, pack connector, pack bay in the enclosure, thermal isolation from the mains module, temperature sensor on the pack.
- Shipping: UN38.3 pack, under 100 Wh, ships as ordinary equipment-with-battery (PI 967 Section II). Pack documentation kept in hardware/.
- Backlog: CELL-055 pack selection and charger design, CELL-056 low-power mode in firmware, CELL-057 RTC hold-up and last-gasp event.
