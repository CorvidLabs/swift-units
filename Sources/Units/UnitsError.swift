/// Errors that can occur when working with units.
public enum UnitsError: Error, Sendable, Hashable {
    /// Invalid conversion between incompatible units.
    case invalidConversion(from: String, to: String)

    /// Division by zero attempted.
    case divisionByZero

    /// Invalid value provided.
    case invalidValue(Double)

    /// Negative value where only positive values are allowed.
    case negativeValue(Double)

    /// Overflow occurred during calculation.
    case overflow

    /// Underflow occurred during calculation.
    case underflow
}

extension UnitsError: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .invalidConversion(from, to):
            return "Cannot convert from \(from) to \(to)"
        case .divisionByZero:
            return "Division by zero"
        case let .invalidValue(value):
            return "Invalid value: \(value)"
        case let .negativeValue(value):
            return "Negative value not allowed: \(value)"
        case .overflow:
            return "Overflow occurred during calculation"
        case .underflow:
            return "Underflow occurred during calculation"
        }
    }
}
