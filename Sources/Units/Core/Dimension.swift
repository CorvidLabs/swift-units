/// Represents the base dimensions in physics.
///
/// These fundamental dimensions form the basis for all physical quantities
/// in the International System of Units (SI).
public enum Dimension: String, Sendable, CaseIterable {
    /// Length dimension (meters)
    case length

    /// Mass dimension (kilograms)
    case mass

    /// Time dimension (seconds)
    case time

    /// Temperature dimension (kelvin)
    case temperature

    /// Amount of substance (moles)
    case amount

    /// Electric current (amperes)
    case current

    /// Luminous intensity (candelas)
    case luminosity

    /// Information dimension (bytes)
    case information

    /// The SI base unit symbol for this dimension.
    public var baseSymbol: String {
        switch self {
        case .length: return "m"
        case .mass: return "kg"
        case .time: return "s"
        case .temperature: return "K"
        case .amount: return "mol"
        case .current: return "A"
        case .luminosity: return "cd"
        case .information: return "B"
        }
    }

    /// The name of the dimension.
    public var name: String {
        rawValue
    }
}
