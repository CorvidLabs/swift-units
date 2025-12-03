/**
 A generic measurement combining a numeric value with a unit.

 `Measurement` provides a type-safe way to work with physical quantities,
 enabling seamless conversions between different units of the same type.
 */
public struct Measurement<UnitType: Unit>: Sendable {
    /// The numeric value of the measurement.
    public let value: Double

    /// The unit of the measurement.
    public let unit: UnitType

    /**
     Creates a new measurement with the specified value and unit.
     - Parameters:
       - value: The numeric value.
       - unit: The unit of measurement.
     */
    public init(value: Double, unit: UnitType) {
        self.value = value
        self.unit = unit
    }

    /**
     Converts this measurement to another unit.
     - Parameter targetUnit: The unit to convert to.
     - Returns: A new measurement in the target unit.
     */
    public func converted(to targetUnit: UnitType) -> Measurement<UnitType> {
        let convertedValue = unit.convert(value, to: targetUnit)
        return Measurement(value: convertedValue, unit: targetUnit)
    }

    /// Returns the value in the base unit.
    public var baseValue: Double {
        unit.toBaseUnit(value)
    }
}

// MARK: - Equatable

extension Measurement: Equatable {
    public static func == (lhs: Measurement<UnitType>, rhs: Measurement<UnitType>) -> Bool {
        abs(lhs.baseValue - rhs.baseValue) < 1e-10
    }
}

// MARK: - Comparable

extension Measurement: Comparable {
    public static func < (lhs: Measurement<UnitType>, rhs: Measurement<UnitType>) -> Bool {
        lhs.baseValue < rhs.baseValue
    }
}

// MARK: - Hashable

extension Measurement: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(baseValue)
    }
}

// MARK: - CustomStringConvertible

extension Measurement: CustomStringConvertible {
    public var description: String {
        "\(value) \(unit.symbol)"
    }
}

// MARK: - Arithmetic Operations

extension Measurement {
    /// Adds two measurements, converting to the left-hand side's unit.
    public static func + (lhs: Measurement<UnitType>, rhs: Measurement<UnitType>) -> Measurement<UnitType> {
        let rhsConverted = rhs.converted(to: lhs.unit)
        return Measurement(value: lhs.value + rhsConverted.value, unit: lhs.unit)
    }

    /// Subtracts two measurements, converting to the left-hand side's unit.
    public static func - (lhs: Measurement<UnitType>, rhs: Measurement<UnitType>) -> Measurement<UnitType> {
        let rhsConverted = rhs.converted(to: lhs.unit)
        return Measurement(value: lhs.value - rhsConverted.value, unit: lhs.unit)
    }

    /// Multiplies a measurement by a scalar.
    public static func * (lhs: Measurement<UnitType>, rhs: Double) -> Measurement<UnitType> {
        Measurement(value: lhs.value * rhs, unit: lhs.unit)
    }

    /// Multiplies a scalar by a measurement.
    public static func * (lhs: Double, rhs: Measurement<UnitType>) -> Measurement<UnitType> {
        Measurement(value: lhs * rhs.value, unit: rhs.unit)
    }

    /// Divides a measurement by a scalar.
    public static func / (lhs: Measurement<UnitType>, rhs: Double) -> Measurement<UnitType> {
        Measurement(value: lhs.value / rhs, unit: lhs.unit)
    }
}
