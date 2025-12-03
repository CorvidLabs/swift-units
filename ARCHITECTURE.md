# swift-units Architecture

## Overview

swift-units is a protocol-oriented, type-safe unit conversion library designed for Swift 6 with full concurrency support. The architecture follows modern Swift patterns emphasizing value types, protocol composition, and compile-time safety.

## Design Principles

### 1. Protocol-Oriented Design

The `Unit` protocol defines the contract for all unit types:

```swift
public protocol Unit: Sendable, Hashable, CustomStringConvertible {
    static var baseUnit: Self { get }
    var symbol: String { get }
    func toBaseUnit(_ value: Double) -> Double
    func fromBaseUnit(_ value: Double) -> Double
}
```

Benefits:
- Extensibility: New units can be added without modifying existing code
- Uniformity: All units follow the same conversion pattern
- Testability: Protocol conformance ensures correct implementation

### 2. Generic Measurement Type

The `Measurement<UnitType: Unit>` generic struct provides type safety:

```swift
public struct Measurement<UnitType: Unit>: Sendable, Equatable, Comparable, Hashable
```

Key features:
- Type-safe operations: Cannot mix incompatible units
- Value semantics: Immutable, thread-safe
- Base value comparison: Measurements compare correctly across different units

### 3. Value Types Over Reference Types

All types are structs or enums:
- Thread-safe by default
- No shared mutable state
- Predictable behavior in concurrent contexts

### 4. Sendable Conformance

Full Swift 6 concurrency support:
- All types conform to `Sendable`
- Can be safely passed across concurrency boundaries
- Works with actors and async/await

## Package Structure

```
swift-units/
├── Package.swift
├── README.md
├── ARCHITECTURE.md
├── Sources/
│   ├── Units/
│   │   ├── Core/
│   │   │   ├── Unit.swift           # Protocol definition
│   │   │   └── Measurement.swift    # Generic measurement type
│   │   ├── Length/
│   │   │   └── LengthUnit.swift     # Length units + extensions
│   │   ├── Mass/
│   │   │   └── MassUnit.swift       # Mass units + extensions
│   │   ├── Temperature/
│   │   │   └── TemperatureUnit.swift # Temperature units + extensions
│   │   ├── Time/
│   │   │   └── TimeUnit.swift       # Time units + extensions
│   │   ├── Data/
│   │   │   └── DataUnit.swift       # Data units + extensions
│   │   └── Constants/
│   │       └── PhysicalConstants.swift # Physical constants
│   └── UnitsExample/
│       └── main.swift               # Example executable
└── Tests/
    └── UnitsTests/
        ├── LengthTests.swift
        ├── MassTests.swift
        ├── TemperatureTests.swift
        ├── TimeTests.swift
        ├── DataTests.swift
        ├── MeasurementTests.swift
        └── PhysicalConstantsTests.swift
```

## Core Components

### Unit Protocol

Defines the interface for all unit types. Each unit must:
1. Specify a base unit (SI unit typically)
2. Provide a symbol for display
3. Implement conversion to/from base unit

Example implementation:

```swift
public enum LengthUnit: Unit {
    case meters  // base unit
    case kilometers

    public static let baseUnit: LengthUnit = .meters

    public var symbol: String {
        switch self {
        case .meters: return "m"
        case .kilometers: return "km"
        }
    }

    public func toBaseUnit(_ value: Double) -> Double {
        switch self {
        case .meters: return value
        case .kilometers: return value * 1000.0
        }
    }

    public func fromBaseUnit(_ value: Double) -> Double {
        switch self {
        case .meters: return value
        case .kilometers: return value / 1000.0
        }
    }
}
```

### Measurement Type

Generic container for value + unit pairs:

```swift
public struct Measurement<UnitType: Unit>: Sendable {
    public let value: Double
    public let unit: UnitType

    public var baseValue: Double {
        unit.toBaseUnit(value)
    }

    public func converted(to targetUnit: UnitType) -> Measurement<UnitType>
}
```

Conformances:
- **Equatable**: Compares base values (allows 1.kilometers == 1000.meters)
- **Comparable**: Enables sorting and ordering
- **Hashable**: Can be used in Sets and Dictionary keys
- **CustomStringConvertible**: Pretty printing

### Numeric Extensions

Elegant syntax through protocol extensions:

```swift
extension BinaryInteger {
    public var kilometers: Length {
        Length(value: Double(self), unit: .kilometers)
    }
}

extension BinaryFloatingPoint {
    public var kilometers: Length {
        Length(value: Double(self), unit: .kilometers)
    }
}
```

Usage:
```swift
let distance = 5.kilometers  // Clean, readable syntax
```

## Conversion Strategy

### Base Unit Pattern

All conversions go through the base unit:

```
Unit A → Base Unit → Unit B
```

Example: Miles to Kilometers
```
5 miles → 8046.72 meters → 8.04672 kilometers
```

Benefits:
- Only need 2 conversions per unit (to/from base)
- Consistent accuracy
- Simplified implementation

### Temperature Special Case

Temperature requires non-linear conversions due to different zero points:

```swift
public func toBaseUnit(_ value: Double) -> Double {
    switch self {
    case .kelvin: return value
    case .celsius: return value + 273.15
    case .fahrenheit: return (value - 32.0) * 5.0 / 9.0 + 273.15
    }
}
```

## Type Safety

### Compile-Time Guarantees

Different measurement types cannot be mixed:

```swift
let length: Measurement<LengthUnit> = 10.meters
let mass: Measurement<MassUnit> = 5.kilograms

// This won't compile:
// let invalid = length + mass  ❌ Type error
```

### Runtime Safety

Comparisons use base values with epsilon tolerance:

```swift
public static func == (lhs: Measurement<UnitType>, rhs: Measurement<UnitType>) -> Bool {
    abs(lhs.baseValue - rhs.baseValue) < 1e-10
}
```

## Testing Strategy

### Comprehensive Coverage

Each unit type has dedicated tests:
- Basic conversions
- Arithmetic operations
- Comparisons across units
- Edge cases (zero, negative, large values)

### Test Structure

Using Swift Testing framework:

```swift
@Suite("Length Unit Tests")
struct LengthTests {
    @Test("Meter conversions")
    func meterConversions() {
        let oneKilometer = 1.0.kilometers
        let inMeters = oneKilometer.converted(to: .meters)
        #expect(inMeters.value == 1000.0)
    }
}
```

## Performance Considerations

### Zero-Cost Abstractions

- Inline conversions
- Value types (no heap allocation)
- Protocol witness tables (static dispatch where possible)

### Measurement Overhead

Minimal runtime cost:
- Two Double values (16 bytes)
- Enum unit (typically 1 byte)
- Total: ~24 bytes per measurement

## Extension Points

### Adding Custom Units

1. Define enum conforming to `Unit`
2. Implement required methods
3. Create type alias for `Measurement`
4. Add numeric extensions

Example:

```swift
public enum SpeedUnit: Unit {
    case metersPerSecond
    case kilometersPerHour

    // ... implement protocol ...
}

public typealias Speed = Measurement<SpeedUnit>

extension BinaryFloatingPoint {
    public var metersPerSecond: Speed {
        Speed(value: Double(self), unit: .metersPerSecond)
    }
}
```

### Adding Derived Units

For units that combine dimensions (e.g., velocity, acceleration):

```swift
public struct Velocity {
    public let distance: Length
    public let time: Time

    public var metersPerSecond: Double {
        distance.converted(to: .meters).value /
        time.converted(to: .seconds).value
    }
}
```

## Concurrency Model

### Thread Safety

All types are thread-safe:
- Immutable value types
- No shared mutable state
- Sendable conformance

### Async Operations

Can be safely used in async contexts:

```swift
Task {
    let distance = 100.kilometers
    let converted = distance.converted(to: .miles)
    print(converted)
}
```

## Error Handling

Conversions use Double math without throwing errors. The library favors:
- Predictable behavior with standard floating-point semantics
- Compile-time type safety to prevent invalid unit mixing
- Runtime tolerance for floating-point comparisons

Future versions may introduce optional validation for:
- Invalid values (NaN, infinity)
- Out-of-range conversions
- Precision warnings

## Future Enhancements

Potential additions:
1. Compound units (m/s², N·m, etc.)
2. Dimensional analysis
3. Currency conversions (with exchange rates)
4. Custom precision/rounding
5. Formatting options
6. Codable conformance for persistence

## Best Practices

### Usage Guidelines

1. Use type aliases for readability:
   ```swift
   let distance: Length = 5.kilometers
   ```

2. Let compiler infer types where clear:
   ```swift
   let result = 10.meters + 5.meters  // Type: Length
   ```

3. Convert once, work in consistent units:
   ```swift
   let distances = [100.meters, 2.kilometers, 50.feet]
   let allMeters = distances.map { $0.converted(to: .meters) }
   ```

4. Use base values for custom calculations:
   ```swift
   let ratio = distance1.baseValue / distance2.baseValue
   ```

## Dependencies

Production dependencies: **None**

Development dependencies:
- swift-docc-plugin: Documentation generation only
- Swift Testing: Included with Swift 6 toolchain

## Platforms

Minimum versions:
- iOS 16.0+
- macOS 13.0+
- tvOS 16.0+
- watchOS 9.0+
- visionOS 1.0+

All platforms support full feature set with no conditional compilation needed.
