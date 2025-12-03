/**
 Units of temperature measurement.

 Temperature conversions are non-linear and require special formulas
 due to different zero points and scales.
 */
public enum TemperatureUnit: Sendable, Hashable {
    /// Kelvin (SI base unit, absolute scale)
    case kelvin

    /// Celsius (°C)
    case celsius

    /// Fahrenheit (°F)
    case fahrenheit

    /// Rankine (°R, absolute scale)
    case rankine
}

// MARK: - Unit Conformance

extension TemperatureUnit: Unit {
    public static let baseUnit: TemperatureUnit = .kelvin

    public var symbol: String {
        switch self {
        case .kelvin: return "K"
        case .celsius: return "°C"
        case .fahrenheit: return "°F"
        case .rankine: return "°R"
        }
    }

    public var description: String {
        symbol
    }

    public func toBaseUnit(_ value: Double) -> Double {
        switch self {
        case .kelvin:
            return value
        case .celsius:
            return value + 273.15
        case .fahrenheit:
            return (value - 32.0) * 5.0 / 9.0 + 273.15
        case .rankine:
            return value * 5.0 / 9.0
        }
    }

    public func fromBaseUnit(_ value: Double) -> Double {
        switch self {
        case .kelvin:
            return value
        case .celsius:
            return value - 273.15
        case .fahrenheit:
            return (value - 273.15) * 9.0 / 5.0 + 32.0
        case .rankine:
            return value * 9.0 / 5.0
        }
    }
}

// MARK: - Convenience Type Aliases

public typealias Temperature = Measurement<TemperatureUnit>

// MARK: - Numeric Extensions

extension BinaryInteger {
    /// Creates a temperature measurement in Kelvin.
    public var kelvin: Temperature {
        Temperature(value: Double(self), unit: .kelvin)
    }

    /// Creates a temperature measurement in Celsius.
    public var celsius: Temperature {
        Temperature(value: Double(self), unit: .celsius)
    }

    /// Creates a temperature measurement in Fahrenheit.
    public var fahrenheit: Temperature {
        Temperature(value: Double(self), unit: .fahrenheit)
    }

    /// Creates a temperature measurement in Rankine.
    public var rankine: Temperature {
        Temperature(value: Double(self), unit: .rankine)
    }
}

extension BinaryFloatingPoint {
    /// Creates a temperature measurement in Kelvin.
    public var kelvin: Temperature {
        Temperature(value: Double(self), unit: .kelvin)
    }

    /// Creates a temperature measurement in Celsius.
    public var celsius: Temperature {
        Temperature(value: Double(self), unit: .celsius)
    }

    /// Creates a temperature measurement in Fahrenheit.
    public var fahrenheit: Temperature {
        Temperature(value: Double(self), unit: .fahrenheit)
    }

    /// Creates a temperature measurement in Rankine.
    public var rankine: Temperature {
        Temperature(value: Double(self), unit: .rankine)
    }
}
