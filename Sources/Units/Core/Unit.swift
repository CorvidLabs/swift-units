/// A protocol representing a unit of measurement.
///
/// Types conforming to `Unit` provide conversion capabilities to and from base units,
/// enabling measurements to be expressed in different scales while maintaining accuracy.
public protocol Unit: Sendable, Hashable, CustomStringConvertible {
    /// The base unit for this unit type.
    static var baseUnit: Self { get }

    /// The symbol representing this unit (e.g., "m", "kg", "°C").
    var symbol: String { get }

    /// Converts a value from this unit to the base unit.
    /// - Parameter value: The value in this unit.
    /// - Returns: The equivalent value in the base unit.
    func toBaseUnit(_ value: Double) -> Double

    /// Converts a value from the base unit to this unit.
    /// - Parameter value: The value in the base unit.
    /// - Returns: The equivalent value in this unit.
    func fromBaseUnit(_ value: Double) -> Double
}

extension Unit {
    /// Converts a value from this unit to another unit.
    /// - Parameters:
    ///   - value: The value in this unit.
    ///   - other: The target unit.
    /// - Returns: The equivalent value in the target unit.
    public func convert(_ value: Double, to other: Self) -> Double {
        let baseValue = toBaseUnit(value)
        return other.fromBaseUnit(baseValue)
    }
}
