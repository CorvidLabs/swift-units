import Testing
@testable import Units

@Suite("Temperature Unit Tests")
struct TemperatureTests {
    @Test("Celsius to Fahrenheit conversion")
    func celsiusToFahrenheit() {
        let zeroCelsius = 0.0.celsius
        let inFahrenheit = zeroCelsius.converted(to: .fahrenheit)

        #expect(abs(inFahrenheit.value - 32.0) < 0.0001)
    }

    @Test("Fahrenheit to Celsius conversion")
    func fahrenheitToCelsius() {
        let fahrenheit = 32.0.fahrenheit
        let inCelsius = fahrenheit.converted(to: .celsius)

        #expect(abs(inCelsius.value - 0.0) < 0.0001)
    }

    @Test("Celsius to Kelvin conversion")
    func celsiusToKelvin() {
        let celsius = 0.0.celsius
        let inKelvin = celsius.converted(to: .kelvin)

        #expect(abs(inKelvin.value - 273.15) < 0.0001)
    }

    @Test("Kelvin to Celsius conversion")
    func kelvinToCelsius() {
        let kelvin = 273.15.kelvin
        let inCelsius = kelvin.converted(to: .celsius)

        #expect(abs(inCelsius.value - 0.0) < 0.0001)
    }

    @Test("Water boiling point")
    func waterBoilingPoint() {
        let celsius = 100.0.celsius
        let fahrenheit = celsius.converted(to: .fahrenheit)
        let kelvin = celsius.converted(to: .kelvin)

        #expect(abs(fahrenheit.value - 212.0) < 0.0001)
        #expect(abs(kelvin.value - 373.15) < 0.0001)
    }

    @Test("Rankine to Kelvin conversion")
    func rankineToKelvin() {
        let rankine = 491.67.rankine
        let kelvin = rankine.converted(to: .kelvin)

        #expect(abs(kelvin.value - 273.15) < 0.0001)
    }

    @Test("Absolute zero")
    func absoluteZero() {
        let kelvin = 0.0.kelvin
        let celsius = kelvin.converted(to: .celsius)
        let fahrenheit = kelvin.converted(to: .fahrenheit)

        #expect(abs(celsius.value - (-273.15)) < 0.0001)
        #expect(abs(fahrenheit.value - (-459.67)) < 0.0001)
    }

    @Test("Addition of temperatures")
    func addition() {
        let result = 10.0.celsius + 5.0.celsius
        #expect(result.value == 15.0)
        #expect(result.unit == .celsius)
    }

    @Test("Comparison")
    func comparison() {
        #expect(100.0.celsius > 50.0.celsius)
        #expect(0.0.celsius == 32.0.fahrenheit)
        #expect(273.15.kelvin == 0.0.celsius)
    }

    @Test("Description")
    func description() {
        let temp = 25.0.celsius
        #expect(temp.description == "25.0 °C")
    }
}
