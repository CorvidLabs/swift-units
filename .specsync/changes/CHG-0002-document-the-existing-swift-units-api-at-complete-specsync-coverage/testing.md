---
change: CHG-0002-document-the-existing-swift-units-api-at-complete-specsync-coverage
artifact: testing
---

# Testing

## Requirement Evidence

| Requirement | Native Evidence |
|-------------|-----------------|
| REQ-units-001, REQ-units-002 | `Tests/UnitsTests/MeasurementTests.swift` |
| REQ-units-003 | `Tests/UnitsTests/LengthTests.swift` |
| REQ-units-004 | `Tests/UnitsTests/MassTests.swift` |
| REQ-units-005 | `Tests/UnitsTests/TimeTests.swift` |
| REQ-units-006 | `Tests/UnitsTests/TemperatureTests.swift` |
| REQ-units-007 | `Tests/UnitsTests/DataTests.swift` |
| REQ-units-008 | `Tests/UnitsTests/PhysicalConstantsTests.swift` |

The Fledge verify lane builds the package and runs the complete native suite. Strict SpecSync must report all eight
files, all implementation LOC, and every parsed export at 100%. The delivery diff must contain no `Sources/` or
`Tests/` changes.
