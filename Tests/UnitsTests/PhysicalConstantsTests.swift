import Testing
@testable import Units

@Suite("Physical Constants Tests")
struct PhysicalConstantsTests {
    @Test("Mathematical constants")
    func mathematicalConstants() {
        #expect(abs(PhysicalConstants.pi - 3.14159265) < 0.0001)
        #expect(abs(PhysicalConstants.e - 2.71828182) < 0.0001)
        #expect(abs(PhysicalConstants.goldenRatio - 1.61803398) < 0.0001)
    }

    @Test("Speed of light")
    func speedOfLight() {
        #expect(PhysicalConstants.speedOfLight == 299_792_458.0)
    }

    @Test("Gravitational constant")
    func gravitationalConstant() {
        #expect(PhysicalConstants.gravitationalConstant == 6.67430e-11)
    }

    @Test("Standard gravity")
    func standardGravity() {
        #expect(PhysicalConstants.standardGravity == 9.80665)
    }

    @Test("Planck constant")
    func planckConstant() {
        #expect(PhysicalConstants.planckConstant == 6.62607015e-34)
    }

    @Test("Avogadro constant")
    func avogadroConstant() {
        #expect(PhysicalConstants.avogadroConstant == 6.02214076e23)
    }

    @Test("Boltzmann constant")
    func boltzmannConstant() {
        #expect(PhysicalConstants.boltzmannConstant == 1.380649e-23)
    }

    @Test("Elementary charge")
    func elementaryCharge() {
        #expect(PhysicalConstants.elementaryCharge == 1.602176634e-19)
    }

    @Test("Electron mass")
    func electronMass() {
        #expect(PhysicalConstants.electronMass == 9.1093837015e-31)
    }

    @Test("Astronomical unit")
    func astronomicalUnit() {
        #expect(PhysicalConstants.astronomicalUnit == 1.495978707e11)
    }

    @Test("Mathematical constants dictionary")
    func mathematicalConstantsDictionary() {
        let constants = PhysicalConstants.mathematicalConstants
        #expect(constants.count == 3)
        #expect(constants["pi"] != nil)
        #expect(constants["e"] != nil)
        #expect(constants["goldenRatio"] != nil)
    }

    @Test("Speed constants dictionary")
    func speedConstantsDictionary() {
        let constants = PhysicalConstants.speedConstants
        #expect(constants.count == 2)
        #expect(constants["speedOfLight"] != nil)
        #expect(constants["speedOfSound"] != nil)
    }

    @Test("Gravitational constants dictionary")
    func gravitationalConstantsDictionary() {
        let constants = PhysicalConstants.gravitationalConstants
        #expect(constants.count == 2)
        #expect(constants["gravitationalConstant"] != nil)
        #expect(constants["standardGravity"] != nil)
    }
}
