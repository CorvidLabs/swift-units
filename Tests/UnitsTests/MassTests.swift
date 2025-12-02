import Testing
@testable import Units

@Suite("Mass Unit Tests")
struct MassTests {
    @Test("Kilogram conversions")
    func kilogramConversions() {
        let oneKilogram = 1.0.kilograms
        let inGrams = oneKilogram.converted(to: .grams)

        #expect(inGrams.value == 1000.0)
        #expect(inGrams.unit == .grams)
    }

    @Test("Pounds to kilograms conversion")
    func poundsToKilograms() {
        let onePound = 1.0.pounds
        let inKilograms = onePound.converted(to: .kilograms)

        #expect(abs(inKilograms.value - 0.45359237) < 0.0001)
    }

    @Test("Ounces to grams conversion")
    func ouncesToGrams() {
        let oneOunce = 1.0.ounces
        let inGrams = oneOunce.converted(to: .grams)

        #expect(abs(inGrams.value - 28.349523125) < 0.0001)
    }

    @Test("Metric tons conversion")
    func metricTons() {
        let oneTon = 1.0.metricTons
        let inKilograms = oneTon.converted(to: .kilograms)

        #expect(inKilograms.value == 1000.0)
    }

    @Test("US tons conversion")
    func usTons() {
        let oneTon = 1.0.tons
        let inKilograms = oneTon.converted(to: .kilograms)

        #expect(abs(inKilograms.value - 907.18474) < 0.0001)
    }

    @Test("Stones conversion")
    func stones() {
        let oneStone = 1.0.stones
        let inKilograms = oneStone.converted(to: .kilograms)

        #expect(abs(inKilograms.value - 6.35029318) < 0.0001)
    }

    @Test("Addition of masses")
    func addition() {
        let result = 1.0.kilograms + 500.0.grams
        #expect(result.value == 1.5)
        #expect(result.unit == .kilograms)
    }

    @Test("Comparison")
    func comparison() {
        #expect(1000.0.grams == 1.0.kilograms)
        #expect(500.0.grams < 1.0.kilograms)
        #expect(2.0.kilograms > 1500.0.grams)
    }

    @Test("Description")
    func description() {
        let mass = 2.5.kilograms
        #expect(mass.description == "2.5 kg")
    }
}
