---
spec: units.spec.md
---

## Key Decisions

- Model each dimension as a Unit enum and reuse generic Measurement behavior.
- Convert compatible values through a family-specific base unit.
- Provide numeric extension properties for concise construction.

## Files to Read First

- `Sources/Units/Core/Unit.swift`
- `Sources/Units/Core/Measurement.swift`
- The concrete unit file for the dimension being changed.

## Current Status

The eight mapped implementation files are stable and covered by native tests. This companion documents existing
behavior only; the rollout makes no source or test changes.
