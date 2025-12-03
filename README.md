# SwiftUnits

![Swift 6.0+](https://img.shields.io/badge/Swift-6.0+-orange.svg)
![Platforms](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS%20%7C%20visionOS%20%7C%20Linux-lightgrey.svg)
![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)

A comprehensive, type-safe unit conversion library for Swift 6, featuring elegant numeric extensions and zero external dependencies.

## Features

- **Pure Swift 6** with strict concurrency support
- **Type-safe measurements** using generics
- **Protocol-oriented design** for extensibility
- **Comprehensive unit coverage**: Length, Mass, Temperature, Time, Data
- **Physical constants** library
- **Elegant syntax** with numeric extensions
- **Zero dependencies** (except swift-docc-plugin for documentation)
- **100% tested** with comprehensive test coverage

## Platform Support

- iOS 16.0+
- macOS 13.0+
- tvOS 16.0+
- watchOS 9.0+
- visionOS 1.0+

## Installation

### Swift Package Manager

Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/0xLeif/swift-units.git", from: "0.1.0")
]
```

## Usage

### Basic Conversions

```swift
import Units

// Length conversions
let distance = 5.kilometers
let inMiles = distance.converted(to: .miles)
print(inMiles) // 3.10685596119... mi

// Mass conversions
let weight = 150.pounds
let inKilograms = weight.converted(to: .kilograms)
print(inKilograms) // 68.03886... kg

// Temperature conversions
let temp = 100.celsius
let inFahrenheit = temp.converted(to: .fahrenheit)
print(inFahrenheit) // 212.0 °F
```

### Arithmetic Operations

```swift
// Addition (automatically converts to left-hand side unit)
let totalDistance = 1.kilometers + 500.meters
print(totalDistance) // 1.5 km

// Subtraction
let remaining = 2.hours - 30.minutes
print(remaining) // 1.5 h

// Scalar multiplication
let doubled = 5.meters * 2.0
print(doubled) // 10.0 m

// Division
let half = 10.kilograms / 2.0
print(half) // 5.0 kg
```

### Comparisons

```swift
// Compare measurements in different units
let distance1 = 1000.meters
let distance2 = 1.kilometers

if distance1 == distance2 {
    print("Equal!") // This prints
}

// All comparison operators work
if 90.seconds > 1.minutes {
    print("Greater than a minute")
}
```

### Data Units (Decimal and Binary)

```swift
// Decimal (SI) units
let file1 = 1.kilobytes  // 1000 bytes
let file2 = 1.megabytes  // 1,000,000 bytes

// Binary (IEC) units
let mem1 = 1.kibibytes   // 1024 bytes
let mem2 = 1.mebibytes   // 1,048,576 bytes

// Convert between them
let result = file1.converted(to: .kibibytes)
print(result) // 0.9765625 KiB
```

### Physical Constants

```swift
import Units

// Mathematical constants
let circumference = 2 * PhysicalConstants.pi * radius
let growth = PhysicalConstants.e

// Physical constants
let lightSpeed = PhysicalConstants.speedOfLight // 299,792,458 m/s
let gravity = PhysicalConstants.standardGravity // 9.80665 m/s²
let planck = PhysicalConstants.planckConstant   // 6.62607015e-34 J·s

// Grouped access
let mathConstants = PhysicalConstants.mathematicalConstants
let speedConstants = PhysicalConstants.speedConstants
```

## Available Units

### Length
- meters, kilometers, centimeters, millimeters
- feet, inches, yards, miles
- nautical miles

### Mass
- kilograms, grams, milligrams, metric tons
- pounds, ounces, tons (US), stones

### Temperature
- celsius, fahrenheit, kelvin, rankine

### Time
- seconds, milliseconds, microseconds, nanoseconds
- minutes, hours, days, weeks, years

### Data
**Decimal (SI):**
- bytes, kilobytes, megabytes, gigabytes, terabytes, petabytes

**Binary (IEC):**
- bytes, kibibytes, mebibytes, gibibytes, tebibytes, pebibytes

## Architecture

### Core Types

#### `Unit` Protocol
The foundation for all unit types, requiring conversion methods to and from base units.

```swift
public protocol Unit: Sendable, Hashable, CustomStringConvertible {
    static var baseUnit: Self { get }
    var symbol: String { get }
    func toBaseUnit(_ value: Double) -> Double
    func fromBaseUnit(_ value: Double) -> Double
}
```

#### `Measurement<UnitType>`
A generic type combining a value with its unit, enabling type-safe conversions.

```swift
public struct Measurement<UnitType: Unit>: Sendable, Equatable, Comparable, Hashable {
    public let value: Double
    public let unit: UnitType
}
```

### Design Principles

- **Protocol-oriented**: Units conform to the `Unit` protocol for maximum flexibility
- **Value types**: Immutable structs ensure thread safety
- **Type safety**: Generic `Measurement` type prevents mixing incompatible units
- **Sendable**: Full Swift 6 concurrency support
- **Comparison by value**: Measurements compare using base unit values

## Advanced Usage

### Custom Units

Extend the library with your own units:

```swift
public enum SpeedUnit: Unit {
    case metersPerSecond
    case kilometersPerHour
    case milesPerHour

    public static let baseUnit = metersPerSecond

    public var symbol: String {
        switch self {
        case .metersPerSecond: return "m/s"
        case .kilometersPerHour: return "km/h"
        case .milesPerHour: return "mph"
        }
    }

    public func toBaseUnit(_ value: Double) -> Double {
        switch self {
        case .metersPerSecond: return value
        case .kilometersPerHour: return value / 3.6
        case .milesPerHour: return value * 0.44704
        }
    }

    public func fromBaseUnit(_ value: Double) -> Double {
        switch self {
        case .metersPerSecond: return value
        case .kilometersPerHour: return value * 3.6
        case .milesPerHour: return value / 0.44704
        }
    }
}

public typealias Speed = Measurement<SpeedUnit>
```

## Testing

Run the comprehensive test suite:

```bash
swift test
```

All tests pass with 100% coverage of core functionality.

## License

MIT License - see LICENSE file for details

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
