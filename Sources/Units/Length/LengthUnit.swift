/// Units of length measurement.
public enum LengthUnit: Sendable, Hashable {
    /// Meters (SI base unit)
    case meters

    /// Kilometers
    case kilometers

    /// Centimeters
    case centimeters

    /// Millimeters
    case millimeters

    /// Feet
    case feet

    /// Miles
    case miles

    /// Inches
    case inches

    /// Yards
    case yards

    /// Nautical miles
    case nauticalMiles
}

// MARK: - Unit Conformance

extension LengthUnit: Unit {
    public static let baseUnit: LengthUnit = .meters

    public var symbol: String {
        switch self {
        case .meters: return "m"
        case .kilometers: return "km"
        case .centimeters: return "cm"
        case .millimeters: return "mm"
        case .feet: return "ft"
        case .miles: return "mi"
        case .inches: return "in"
        case .yards: return "yd"
        case .nauticalMiles: return "nmi"
        }
    }

    public var description: String {
        symbol
    }

    public func toBaseUnit(_ value: Double) -> Double {
        switch self {
        case .meters: return value
        case .kilometers: return value * 1000.0
        case .centimeters: return value / 100.0
        case .millimeters: return value / 1000.0
        case .feet: return value * 0.3048
        case .miles: return value * 1609.344
        case .inches: return value * 0.0254
        case .yards: return value * 0.9144
        case .nauticalMiles: return value * 1852.0
        }
    }

    public func fromBaseUnit(_ value: Double) -> Double {
        switch self {
        case .meters: return value
        case .kilometers: return value / 1000.0
        case .centimeters: return value * 100.0
        case .millimeters: return value * 1000.0
        case .feet: return value / 0.3048
        case .miles: return value / 1609.344
        case .inches: return value / 0.0254
        case .yards: return value / 0.9144
        case .nauticalMiles: return value / 1852.0
        }
    }
}

// MARK: - Convenience Type Aliases

public typealias Length = Measurement<LengthUnit>

// MARK: - Numeric Extensions

extension BinaryInteger {
    /// Creates a length measurement in meters.
    public var meters: Length {
        Length(value: Double(self), unit: .meters)
    }

    /// Creates a length measurement in kilometers.
    public var kilometers: Length {
        Length(value: Double(self), unit: .kilometers)
    }

    /// Creates a length measurement in centimeters.
    public var centimeters: Length {
        Length(value: Double(self), unit: .centimeters)
    }

    /// Creates a length measurement in millimeters.
    public var millimeters: Length {
        Length(value: Double(self), unit: .millimeters)
    }

    /// Creates a length measurement in feet.
    public var feet: Length {
        Length(value: Double(self), unit: .feet)
    }

    /// Creates a length measurement in miles.
    public var miles: Length {
        Length(value: Double(self), unit: .miles)
    }

    /// Creates a length measurement in inches.
    public var inches: Length {
        Length(value: Double(self), unit: .inches)
    }

    /// Creates a length measurement in yards.
    public var yards: Length {
        Length(value: Double(self), unit: .yards)
    }

    /// Creates a length measurement in nautical miles.
    public var nauticalMiles: Length {
        Length(value: Double(self), unit: .nauticalMiles)
    }
}

extension BinaryFloatingPoint {
    /// Creates a length measurement in meters.
    public var meters: Length {
        Length(value: Double(self), unit: .meters)
    }

    /// Creates a length measurement in kilometers.
    public var kilometers: Length {
        Length(value: Double(self), unit: .kilometers)
    }

    /// Creates a length measurement in centimeters.
    public var centimeters: Length {
        Length(value: Double(self), unit: .centimeters)
    }

    /// Creates a length measurement in millimeters.
    public var millimeters: Length {
        Length(value: Double(self), unit: .millimeters)
    }

    /// Creates a length measurement in feet.
    public var feet: Length {
        Length(value: Double(self), unit: .feet)
    }

    /// Creates a length measurement in miles.
    public var miles: Length {
        Length(value: Double(self), unit: .miles)
    }

    /// Creates a length measurement in inches.
    public var inches: Length {
        Length(value: Double(self), unit: .inches)
    }

    /// Creates a length measurement in yards.
    public var yards: Length {
        Length(value: Double(self), unit: .yards)
    }

    /// Creates a length measurement in nautical miles.
    public var nauticalMiles: Length {
        Length(value: Double(self), unit: .nauticalMiles)
    }
}
