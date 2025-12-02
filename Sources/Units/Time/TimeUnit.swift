/// Units of time measurement.
public enum TimeUnit: Sendable, Hashable {
    /// Seconds (SI base unit)
    case seconds

    /// Milliseconds
    case milliseconds

    /// Microseconds
    case microseconds

    /// Nanoseconds
    case nanoseconds

    /// Minutes
    case minutes

    /// Hours
    case hours

    /// Days
    case days

    /// Weeks
    case weeks

    /// Years (365.25 days)
    case years
}

// MARK: - Unit Conformance

extension TimeUnit: Unit {
    public static let baseUnit: TimeUnit = .seconds

    public var symbol: String {
        switch self {
        case .seconds: return "s"
        case .milliseconds: return "ms"
        case .microseconds: return "μs"
        case .nanoseconds: return "ns"
        case .minutes: return "min"
        case .hours: return "h"
        case .days: return "d"
        case .weeks: return "wk"
        case .years: return "yr"
        }
    }

    public var description: String {
        symbol
    }

    public func toBaseUnit(_ value: Double) -> Double {
        switch self {
        case .seconds: return value
        case .milliseconds: return value / 1000.0
        case .microseconds: return value / 1_000_000.0
        case .nanoseconds: return value / 1_000_000_000.0
        case .minutes: return value * 60.0
        case .hours: return value * 3600.0
        case .days: return value * 86400.0
        case .weeks: return value * 604800.0
        case .years: return value * 31_557_600.0 // 365.25 days
        }
    }

    public func fromBaseUnit(_ value: Double) -> Double {
        switch self {
        case .seconds: return value
        case .milliseconds: return value * 1000.0
        case .microseconds: return value * 1_000_000.0
        case .nanoseconds: return value * 1_000_000_000.0
        case .minutes: return value / 60.0
        case .hours: return value / 3600.0
        case .days: return value / 86400.0
        case .weeks: return value / 604800.0
        case .years: return value / 31_557_600.0
        }
    }
}

// MARK: - Convenience Type Aliases

public typealias Time = Measurement<TimeUnit>

// MARK: - Numeric Extensions

extension BinaryInteger {
    /// Creates a time measurement in seconds.
    public var seconds: Time {
        Time(value: Double(self), unit: .seconds)
    }

    /// Creates a time measurement in milliseconds.
    public var milliseconds: Time {
        Time(value: Double(self), unit: .milliseconds)
    }

    /// Creates a time measurement in microseconds.
    public var microseconds: Time {
        Time(value: Double(self), unit: .microseconds)
    }

    /// Creates a time measurement in nanoseconds.
    public var nanoseconds: Time {
        Time(value: Double(self), unit: .nanoseconds)
    }

    /// Creates a time measurement in minutes.
    public var minutes: Time {
        Time(value: Double(self), unit: .minutes)
    }

    /// Creates a time measurement in hours.
    public var hours: Time {
        Time(value: Double(self), unit: .hours)
    }

    /// Creates a time measurement in days.
    public var days: Time {
        Time(value: Double(self), unit: .days)
    }

    /// Creates a time measurement in weeks.
    public var weeks: Time {
        Time(value: Double(self), unit: .weeks)
    }

    /// Creates a time measurement in years.
    public var years: Time {
        Time(value: Double(self), unit: .years)
    }
}

extension BinaryFloatingPoint {
    /// Creates a time measurement in seconds.
    public var seconds: Time {
        Time(value: Double(self), unit: .seconds)
    }

    /// Creates a time measurement in milliseconds.
    public var milliseconds: Time {
        Time(value: Double(self), unit: .milliseconds)
    }

    /// Creates a time measurement in microseconds.
    public var microseconds: Time {
        Time(value: Double(self), unit: .microseconds)
    }

    /// Creates a time measurement in nanoseconds.
    public var nanoseconds: Time {
        Time(value: Double(self), unit: .nanoseconds)
    }

    /// Creates a time measurement in minutes.
    public var minutes: Time {
        Time(value: Double(self), unit: .minutes)
    }

    /// Creates a time measurement in hours.
    public var hours: Time {
        Time(value: Double(self), unit: .hours)
    }

    /// Creates a time measurement in days.
    public var days: Time {
        Time(value: Double(self), unit: .days)
    }

    /// Creates a time measurement in weeks.
    public var weeks: Time {
        Time(value: Double(self), unit: .weeks)
    }

    /// Creates a time measurement in years.
    public var years: Time {
        Time(value: Double(self), unit: .years)
    }
}
