---
spec: units.spec.md
---

## Automated Testing

| Test File | Requirements | What It Covers |
|-----------|--------------|----------------|
| `MeasurementTests.swift` | REQ-units-001, REQ-units-002 | Conversion, equality, ordering, arithmetic, hashing, and description. |
| `LengthTests.swift` | REQ-units-003 | Metric, customary, nautical, construction, arithmetic, and formatting. |
| `MassTests.swift` | REQ-units-004 | Metric/customary conversion, construction, arithmetic, and formatting. |
| `TimeTests.swift` | REQ-units-005 | Subsecond through year conversion, arithmetic, and formatting. |
| `TemperatureTests.swift` | REQ-units-006 | Kelvin, Celsius, Fahrenheit, Rankine, boiling point, and absolute zero. |
| `DataTests.swift` | REQ-units-007 | Bits/bytes, decimal/binary units, arithmetic, comparison, and formatting. |
| `PhysicalConstantsTests.swift` | REQ-units-008 | Constant values and named dictionaries. |

## Manual Testing

No interactive flow exists. Run the Fledge verify lane, strict SpecSync at 100%, and Trust from a clean checkout.

## Edge Cases & Boundary Conditions

| Scenario | Expected Behavior |
|----------|-------------------|
| Converting a base unit to itself | Numeric value is unchanged. |
| Converting below absolute zero | Double conversion proceeds without policy validation. |
| Comparing different units in one family | Base values determine ordering and equality. |
| Decimal versus binary data units | Powers of 1000 and 1024 remain distinct. |
| NaN or infinity input | Swift Double semantics propagate. |
