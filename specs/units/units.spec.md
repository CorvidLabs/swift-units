---
module: units
version: 2
status: stable
files:
  - Sources/Units/Constants/PhysicalConstants.swift
  - Sources/Units/Core/Measurement.swift
  - Sources/Units/Core/Unit.swift
  - Sources/Units/Data/DataUnit.swift
  - Sources/Units/Length/LengthUnit.swift
  - Sources/Units/Mass/MassUnit.swift
  - Sources/Units/Temperature/TemperatureUnit.swift
  - Sources/Units/Time/TimeUnit.swift
db_tables: []
depends_on: []
---

# Units

## Purpose

`Units` is a dependency-free, Sendable measurement library. It defines a generic conversion protocol and measurement
value, concrete length, mass, time, temperature, and data unit families, numeric convenience accessors, and named
mathematical and physical constants.

## Public API

| Symbol | Description |
|--------|-------------|
| `Unit` | Core conversion contract. |
| `symbol` | Core conversion contract. |
| `baseUnit` | Core conversion contract. |
| `toBaseUnit` | Core conversion contract. |
| `fromBaseUnit` | Core conversion contract. |
| `convert` | Core conversion contract. |
| `Measurement` | Generic measurement value and operation. |
| `value` | Generic measurement value and operation. |
| `unit` | Generic measurement value and operation. |
| `baseValue` | Generic measurement value and operation. |
| `init` | Generic measurement value and operation. |
| `converted` | Generic measurement value and operation. |
| `description` | Generic measurement value and operation. |
| `hash` | Generic measurement value and operation. |
| `==` | Generic measurement value and operation. |
| `+` | Generic measurement value and operation. |
| `-` | Generic measurement value and operation. |
| `*` | Generic measurement value and operation. |
| `/` | Generic measurement value and operation. |
| `LengthUnit` | Length unit API. |
| `Length` | Length unit API. |
| `millimeters` | Length unit API. |
| `centimeters` | Length unit API. |
| `meters` | Length unit API. |
| `kilometers` | Length unit API. |
| `inches` | Length unit API. |
| `feet` | Length unit API. |
| `yards` | Length unit API. |
| `miles` | Length unit API. |
| `nauticalMiles` | Length unit API. |
| `MassUnit` | Mass unit API. |
| `Mass` | Mass unit API. |
| `milligrams` | Mass unit API. |
| `grams` | Mass unit API. |
| `kilograms` | Mass unit API. |
| `metricTons` | Mass unit API. |
| `ounces` | Mass unit API. |
| `pounds` | Mass unit API. |
| `stones` | Mass unit API. |
| `tons` | Mass unit API. |
| `TimeUnit` | Time unit API. |
| `Time` | Time unit API. |
| `nanoseconds` | Time unit API. |
| `microseconds` | Time unit API. |
| `milliseconds` | Time unit API. |
| `seconds` | Time unit API. |
| `minutes` | Time unit API. |
| `hours` | Time unit API. |
| `days` | Time unit API. |
| `weeks` | Time unit API. |
| `years` | Time unit API. |
| `TemperatureUnit` | Temperature unit API. |
| `Temperature` | Temperature unit API. |
| `kelvin` | Temperature unit API. |
| `celsius` | Temperature unit API. |
| `fahrenheit` | Temperature unit API. |
| `rankine` | Temperature unit API. |
| `DataUnit` | Data unit API. |
| `DataSize` | Data unit API. |
| `bits` | Data unit API. |
| `bytes` | Data unit API. |
| `kilobytes` | Data unit API. |
| `megabytes` | Data unit API. |
| `gigabytes` | Data unit API. |
| `terabytes` | Data unit API. |
| `petabytes` | Data unit API. |
| `kibibytes` | Data unit API. |
| `mebibytes` | Data unit API. |
| `gibibytes` | Data unit API. |
| `tebibytes` | Data unit API. |
| `pebibytes` | Data unit API. |
| `PhysicalConstants` | Physical constant API. |
| `pi` | Physical constant API. |
| `e` | Physical constant API. |
| `goldenRatio` | Physical constant API. |
| `speedOfLight` | Physical constant API. |
| `speedOfSound` | Physical constant API. |
| `gravitationalConstant` | Physical constant API. |
| `standardGravity` | Physical constant API. |
| `planckConstant` | Physical constant API. |
| `reducedPlanckConstant` | Physical constant API. |
| `planckLength` | Physical constant API. |
| `planckTime` | Physical constant API. |
| `planckMass` | Physical constant API. |
| `planckTemperature` | Physical constant API. |
| `elementaryCharge` | Physical constant API. |
| `electronMass` | Physical constant API. |
| `protonMass` | Physical constant API. |
| `neutronMass` | Physical constant API. |
| `fineStructureConstant` | Physical constant API. |
| `rydbergConstant` | Physical constant API. |
| `avogadroConstant` | Physical constant API. |
| `boltzmannConstant` | Physical constant API. |
| `gasConstant` | Physical constant API. |
| `stefanBoltzmannConstant` | Physical constant API. |
| `vacuumPermittivity` | Physical constant API. |
| `vacuumPermeability` | Physical constant API. |
| `magneticFluxQuantum` | Physical constant API. |
| `bohrRadius` | Physical constant API. |
| `atomicMassUnit` | Physical constant API. |
| `electronVolt` | Physical constant API. |
| `calorie` | Physical constant API. |
| `astronomicalUnit` | Physical constant API. |
| `lightYear` | Physical constant API. |
| `parsec` | Physical constant API. |
| `solarMass` | Physical constant API. |
| `earthMass` | Physical constant API. |
| `earthRadius` | Physical constant API. |
| `mathematicalConstants` | Physical constant API. |
| `speedConstants` | Physical constant API. |
| `gravitationalConstants` | Physical constant API. |

## Invariants

1. Each unit family has exactly one base unit and converts through that base representation.
2. Converting a measurement does not mutate the original value.
3. Equality, ordering, hashing, and addition/subtraction compare compatible measurements through base values.
4. Multiplication and division by a scalar preserve the measurement's unit.
5. Temperature conversion applies offsets as well as scale factors; other families use multiplicative factors.
6. Decimal data units use powers of 1000 and IEC binary units use powers of 1024.

## Behavioral Examples

- `1.0.kilometers.converted(to: .meters)` yields 1000 meters.
- `32.0.fahrenheit.converted(to: .celsius)` yields 0 Celsius within floating-point tolerance.
- `1.0.kibibytes.converted(to: .bytes)` yields 1024 bytes.
- Adding `1.0.hours` and `30.0.minutes` yields a value equivalent to 1.5 hours.

## Error Cases

The API is non-throwing. Inputs use `Double` semantics, so infinities and NaN propagate according to Swift
floating-point behavior. Unit-family compatibility is enforced statically by the generic `Measurement<UnitType>`.

## Dependencies

Runtime code uses the Swift standard library only. Swift DocC is a package documentation plugin and does not participate
in conversions.

## Change Log

| Date | Change |
|------|--------|
| 2026-07-13 | Documented the existing complete public contract for SpecSync 5 governance. |
| 2026-07-14 | CHG-0002-document-the-existing-swift-units-api-at-complete-specsync-coverage: Document the existing Swift Units API at complete SpecSync coverage |
