/// Units of mass measurement.
public enum MassUnit: Sendable, Hashable {
    /// Kilograms (SI base unit)
    case kilograms

    /// Grams
    case grams

    /// Milligrams
    case milligrams

    /// Metric tons
    case metricTons

    /// Pounds
    case pounds

    /// Ounces
    case ounces

    /// Tons (US short tons)
    case tons

    /// Stones
    case stones
}

// MARK: - Unit Conformance

extension MassUnit: Unit {
    public static let baseUnit: MassUnit = .kilograms

    public var symbol: String {
        switch self {
        case .kilograms: return "kg"
        case .grams: return "g"
        case .milligrams: return "mg"
        case .metricTons: return "t"
        case .pounds: return "lb"
        case .ounces: return "oz"
        case .tons: return "ton"
        case .stones: return "st"
        }
    }

    public var description: String {
        symbol
    }

    public func toBaseUnit(_ value: Double) -> Double {
        switch self {
        case .kilograms: return value
        case .grams: return value / 1000.0
        case .milligrams: return value / 1_000_000.0
        case .metricTons: return value * 1000.0
        case .pounds: return value * 0.45359237
        case .ounces: return value * 0.028349523125
        case .tons: return value * 907.18474
        case .stones: return value * 6.35029318
        }
    }

    public func fromBaseUnit(_ value: Double) -> Double {
        switch self {
        case .kilograms: return value
        case .grams: return value * 1000.0
        case .milligrams: return value * 1_000_000.0
        case .metricTons: return value / 1000.0
        case .pounds: return value / 0.45359237
        case .ounces: return value / 0.028349523125
        case .tons: return value / 907.18474
        case .stones: return value / 6.35029318
        }
    }
}

// MARK: - Convenience Type Aliases

public typealias Mass = Measurement<MassUnit>

// MARK: - Numeric Extensions

extension BinaryInteger {
    /// Creates a mass measurement in kilograms.
    public var kilograms: Mass {
        Mass(value: Double(self), unit: .kilograms)
    }

    /// Creates a mass measurement in grams.
    public var grams: Mass {
        Mass(value: Double(self), unit: .grams)
    }

    /// Creates a mass measurement in milligrams.
    public var milligrams: Mass {
        Mass(value: Double(self), unit: .milligrams)
    }

    /// Creates a mass measurement in metric tons.
    public var metricTons: Mass {
        Mass(value: Double(self), unit: .metricTons)
    }

    /// Creates a mass measurement in pounds.
    public var pounds: Mass {
        Mass(value: Double(self), unit: .pounds)
    }

    /// Creates a mass measurement in ounces.
    public var ounces: Mass {
        Mass(value: Double(self), unit: .ounces)
    }

    /// Creates a mass measurement in tons.
    public var tons: Mass {
        Mass(value: Double(self), unit: .tons)
    }

    /// Creates a mass measurement in stones.
    public var stones: Mass {
        Mass(value: Double(self), unit: .stones)
    }
}

extension BinaryFloatingPoint {
    /// Creates a mass measurement in kilograms.
    public var kilograms: Mass {
        Mass(value: Double(self), unit: .kilograms)
    }

    /// Creates a mass measurement in grams.
    public var grams: Mass {
        Mass(value: Double(self), unit: .grams)
    }

    /// Creates a mass measurement in milligrams.
    public var milligrams: Mass {
        Mass(value: Double(self), unit: .milligrams)
    }

    /// Creates a mass measurement in metric tons.
    public var metricTons: Mass {
        Mass(value: Double(self), unit: .metricTons)
    }

    /// Creates a mass measurement in pounds.
    public var pounds: Mass {
        Mass(value: Double(self), unit: .pounds)
    }

    /// Creates a mass measurement in ounces.
    public var ounces: Mass {
        Mass(value: Double(self), unit: .ounces)
    }

    /// Creates a mass measurement in tons.
    public var tons: Mass {
        Mass(value: Double(self), unit: .tons)
    }

    /// Creates a mass measurement in stones.
    public var stones: Mass {
        Mass(value: Double(self), unit: .stones)
    }
}
