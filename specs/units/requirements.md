---
spec: units.spec.md
---

# Requirements

### REQ-units-001

The Unit protocol SHALL define a symbol, a base unit, and conversion to and from that base representation.

Acceptance Criteria
- Every concrete unit family supplies a deterministic base unit.
- A value converted to base and back to the original unit is equivalent within floating-point precision.

### REQ-units-002

Measurement SHALL provide immutable value/unit storage, conversion, formatting, hashing, equality, ordering, and scalar
or compatible-measurement arithmetic.

Acceptance Criteria
- Cross-unit equality and ordering use base values.
- Addition and subtraction return the left operand's unit; scalar multiplication and division preserve its unit.

### REQ-units-003

Length SHALL support metric, imperial, US customary, and nautical unit conversions plus integer and floating-point
constructors.

Acceptance Criteria
- Metric and customary conversions use meters as the base representation.
- Numeric extension properties construct the documented length unit.

### REQ-units-004

Mass SHALL support metric and customary mass conversions plus integer and floating-point constructors.

Acceptance Criteria
- Metric and customary conversions use kilograms as the base representation.
- Numeric extension properties construct the documented mass unit.

### REQ-units-005

Time SHALL support nanoseconds through years with seconds as the base unit and numeric constructors for each unit.

Acceptance Criteria
- Subsecond through week conversions use their documented factors relative to seconds.
- A year uses the implementation's 365.25-day conversion factor.

### REQ-units-006

Temperature SHALL support Kelvin, Celsius, Fahrenheit, and Rankine with correct scale and offset conversion.

Acceptance Criteria
- Water freezing and boiling reference values convert within floating-point tolerance.
- Kelvin remains the base representation.

### REQ-units-007

DataSize SHALL distinguish bits and bytes, SI decimal units, and IEC binary units with numeric constructors.

Acceptance Criteria
- One byte converts to eight bits.
- Decimal units use powers of 1000 and binary units use powers of 1024.

### REQ-units-008

PhysicalConstants SHALL expose the implemented mathematical, mechanical, quantum, thermodynamic, particle,
astronomical, electromagnetic, and Planck-scale constants and the three named constant dictionaries.

Acceptance Criteria
- Named constants retain the values and units declared by the implementation.
- The three dictionaries contain their documented category members.

## Constraints

- Public model types and unit enums remain Sendable and Hashable as implemented.
- Conversion and arithmetic are synchronous and dependency-free.
- Values use Double storage and preserve Swift floating-point semantics.

## Out of Scope

- Dimensional analysis across different unit families, compound units, locale-aware formatting, arbitrary-precision
  arithmetic, mutable global constants, or behavior changes in this documentation-only migration.
