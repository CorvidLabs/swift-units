# Changelog

## [0.1.0] - 2025-12-02

### Added
- Type-safe unit conversion library with generic `Measurement<UnitType>` type
- `Unit` protocol for extensible unit definitions
- Length units: meters, kilometers, centimeters, millimeters, feet, inches, yards, miles, nautical miles
- Mass units: kilograms, grams, milligrams, metric tons, pounds, ounces, tons, stones
- Temperature units: celsius, fahrenheit, kelvin, rankine
- Time units: seconds, milliseconds, microseconds, nanoseconds, minutes, hours, days, weeks, years
- Data units with decimal (SI) and binary (IEC) support
- Physical constants library with 40+ fundamental constants
- Numeric extensions for elegant syntax (e.g., `5.kilometers`)
- Arithmetic operations (+, -, *, /) for measurements
- Comparison operations with automatic unit conversion
- Full Swift 6 concurrency support (Sendable types)
- Comprehensive test suite
