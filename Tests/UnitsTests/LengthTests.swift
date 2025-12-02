import Testing
@testable import Units

@Suite("Length Unit Tests")
struct LengthTests {
    @Test("Meter conversions")
    func meterConversions() {
        let oneKilometer = 1.0.kilometers
        let inMeters = oneKilometer.converted(to: .meters)

        #expect(inMeters.value == 1000.0)
        #expect(inMeters.unit == .meters)
    }

    @Test("Feet to meters conversion")
    func feetToMeters() {
        let tenFeet = 10.0.feet
        let inMeters = tenFeet.converted(to: .meters)

        #expect(abs(inMeters.value - 3.048) < 0.0001)
    }

    @Test("Miles to kilometers conversion")
    func milesToKilometers() {
        let oneMile = 1.0.miles
        let inKilometers = oneMile.converted(to: .kilometers)

        #expect(abs(inKilometers.value - 1.609344) < 0.0001)
    }

    @Test("Nautical miles conversion")
    func nauticalMiles() {
        let oneNauticalMile = 1.0.nauticalMiles
        let inMeters = oneNauticalMile.converted(to: .meters)

        #expect(inMeters.value == 1852.0)
    }

    @Test("Integer extension")
    func integerExtension() {
        let length = 5.kilometers
        #expect(length.value == 5.0)
        #expect(length.unit == .kilometers)
    }

    @Test("Addition of lengths")
    func addition() {
        let result = 1.0.kilometers + 500.0.meters
        #expect(result.value == 1.5)
        #expect(result.unit == .kilometers)
    }

    @Test("Subtraction of lengths")
    func subtraction() {
        let result = 1000.0.meters - 0.5.kilometers
        #expect(result.value == 500.0)
        #expect(result.unit == .meters)
    }

    @Test("Multiplication by scalar")
    func multiplication() {
        let result = 5.0.meters * 3.0
        #expect(result.value == 15.0)
        #expect(result.unit == .meters)
    }

    @Test("Division by scalar")
    func division() {
        let result = 10.0.meters / 2.0
        #expect(result.value == 5.0)
        #expect(result.unit == .meters)
    }

    @Test("Comparison")
    func comparison() {
        #expect(1000.0.meters > 0.5.kilometers)
        #expect(1.0.kilometers == 1000.0.meters)
        #expect(500.0.meters < 1.0.kilometers)
    }

    @Test("Description")
    func description() {
        let length = 5.5.kilometers
        #expect(length.description == "5.5 km")
    }
}
