import Testing
@testable import Units

@Suite("Measurement Tests")
struct MeasurementTests {
    @Test("Generic measurement creation")
    func creation() {
        let length = Measurement(value: 10.0, unit: LengthUnit.meters)
        #expect(length.value == 10.0)
        #expect(length.unit == .meters)
    }

    @Test("Base value calculation")
    func baseValue() {
        let length = Measurement(value: 5.0, unit: LengthUnit.kilometers)
        #expect(length.baseValue == 5000.0)
    }

    @Test("Hashable conformance")
    func hashable() {
        let m1 = Measurement(value: 10.0, unit: LengthUnit.meters)
        let m2 = Measurement(value: 10.0, unit: LengthUnit.meters)
        let m3 = Measurement(value: 20.0, unit: LengthUnit.meters)

        #expect(m1 == m2)
        #expect(m1 != m3)
    }

    @Test("Sendable conformance")
    func sendable() async {
        let measurement = Measurement(value: 10.0, unit: LengthUnit.meters)

        await Task {
            let value = measurement.value
            #expect(value == 10.0)
        }.value
    }

    @Test("Mixed unit arithmetic")
    func mixedUnitArithmetic() {
        let result = 1.0.kilometers + 500.0.meters
        #expect(result.unit == .kilometers)
        #expect(result.value == 1.5)
    }

    @Test("Scalar multiplication commutativity")
    func scalarMultiplicationCommutativity() {
        let m1 = 5.0 * 10.0.meters
        let m2 = 10.0.meters * 5.0

        #expect(m1.value == m2.value)
        #expect(m1.unit == m2.unit)
    }

    @Test("Type safety")
    func typeSafety() {
        // This demonstrates that different measurement types cannot be mixed
        let length: Measurement<LengthUnit> = 10.0.meters
        let mass: Measurement<MassUnit> = 5.0.kilograms

        // These are different types and cannot be added
        #expect(type(of: length) != type(of: mass))
    }
}
