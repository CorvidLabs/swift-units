/// Fundamental physical and mathematical constants.
///
/// All values are provided in SI units where applicable.
public enum PhysicalConstants {
    // MARK: - Mathematical Constants

    /// Pi (π) - The ratio of a circle's circumference to its diameter
    public static let pi: Double = .pi

    /// Euler's number (e) - The base of natural logarithms
    public static let e: Double = 2.718281828459045

    /// Golden ratio (φ) - (1 + √5) / 2
    public static let goldenRatio: Double = 1.618033988749895

    // MARK: - Speed and Light

    /// Speed of light in vacuum (c)
    /// Unit: meters per second (m/s)
    public static let speedOfLight: Double = 299_792_458.0

    /// Speed of sound in air at 20°C
    /// Unit: meters per second (m/s)
    public static let speedOfSound: Double = 343.0

    // MARK: - Gravitational Constants

    /// Gravitational constant (G)
    /// Unit: m³/(kg·s²)
    public static let gravitationalConstant: Double = 6.67430e-11

    /// Standard gravity (g) - Earth's surface gravity
    /// Unit: meters per second squared (m/s²)
    public static let standardGravity: Double = 9.80665

    // MARK: - Planck Constants

    /// Planck constant (h)
    /// Unit: joule-seconds (J·s)
    public static let planckConstant: Double = 6.62607015e-34

    /// Reduced Planck constant (ℏ) - h / 2π
    /// Unit: joule-seconds (J·s)
    public static let reducedPlanckConstant: Double = 1.054571817e-34

    /// Planck length
    /// Unit: meters (m)
    public static let planckLength: Double = 1.616255e-35

    /// Planck time
    /// Unit: seconds (s)
    public static let planckTime: Double = 5.391247e-44

    /// Planck mass
    /// Unit: kilograms (kg)
    public static let planckMass: Double = 2.176434e-8

    /// Planck temperature
    /// Unit: kelvin (K)
    public static let planckTemperature: Double = 1.416784e32

    // MARK: - Quantum and Atomic

    /// Elementary charge (e)
    /// Unit: coulombs (C)
    public static let elementaryCharge: Double = 1.602176634e-19

    /// Electron mass
    /// Unit: kilograms (kg)
    public static let electronMass: Double = 9.1093837015e-31

    /// Proton mass
    /// Unit: kilograms (kg)
    public static let protonMass: Double = 1.67262192369e-27

    /// Neutron mass
    /// Unit: kilograms (kg)
    public static let neutronMass: Double = 1.67492749804e-27

    /// Fine structure constant (α)
    /// Dimensionless
    public static let fineStructureConstant: Double = 7.2973525693e-3

    /// Rydberg constant
    /// Unit: per meter (m⁻¹)
    public static let rydbergConstant: Double = 10_973_731.568160

    // MARK: - Thermodynamic

    /// Avogadro constant (Nₐ)
    /// Unit: per mole (mol⁻¹)
    public static let avogadroConstant: Double = 6.02214076e23

    /// Boltzmann constant (k)
    /// Unit: joules per kelvin (J/K)
    public static let boltzmannConstant: Double = 1.380649e-23

    /// Gas constant (R)
    /// Unit: joules per mole-kelvin (J/(mol·K))
    public static let gasConstant: Double = 8.314462618

    /// Stefan-Boltzmann constant (σ)
    /// Unit: watts per square meter-kelvin⁴ (W/(m²·K⁴))
    public static let stefanBoltzmannConstant: Double = 5.670374419e-8

    // MARK: - Electromagnetic

    /// Vacuum permittivity (ε₀)
    /// Unit: farads per meter (F/m)
    public static let vacuumPermittivity: Double = 8.8541878128e-12

    /// Vacuum permeability (μ₀)
    /// Unit: henries per meter (H/m)
    public static let vacuumPermeability: Double = 1.25663706212e-6

    /// Magnetic flux quantum (Φ₀)
    /// Unit: webers (Wb)
    public static let magneticFluxQuantum: Double = 2.067833848e-15

    // MARK: - Atomic Units

    /// Bohr radius (a₀)
    /// Unit: meters (m)
    public static let bohrRadius: Double = 5.29177210903e-11

    /// Atomic mass unit (u)
    /// Unit: kilograms (kg)
    public static let atomicMassUnit: Double = 1.66053906660e-27

    // MARK: - Energy Conversions

    /// Electron volt in joules (eV)
    /// Unit: joules (J)
    public static let electronVolt: Double = 1.602176634e-19

    /// Calorie in joules
    /// Unit: joules (J)
    public static let calorie: Double = 4.184

    // MARK: - Astronomical

    /// Astronomical unit (mean Earth-Sun distance)
    /// Unit: meters (m)
    public static let astronomicalUnit: Double = 1.495978707e11

    /// Light year
    /// Unit: meters (m)
    public static let lightYear: Double = 9.4607304725808e15

    /// Parsec
    /// Unit: meters (m)
    public static let parsec: Double = 3.0856775814913673e16

    /// Solar mass
    /// Unit: kilograms (kg)
    public static let solarMass: Double = 1.98847e30

    /// Earth mass
    /// Unit: kilograms (kg)
    public static let earthMass: Double = 5.97237e24

    /// Earth radius (mean)
    /// Unit: meters (m)
    public static let earthRadius: Double = 6.371e6
}

// MARK: - Convenience Extensions

extension PhysicalConstants {
    /// Returns a dictionary of all mathematical constants
    public static var mathematicalConstants: [String: Double] {
        [
            "pi": pi,
            "e": e,
            "goldenRatio": goldenRatio
        ]
    }

    /// Returns a dictionary of all speed constants
    public static var speedConstants: [String: Double] {
        [
            "speedOfLight": speedOfLight,
            "speedOfSound": speedOfSound
        ]
    }

    /// Returns a dictionary of all gravitational constants
    public static var gravitationalConstants: [String: Double] {
        [
            "gravitationalConstant": gravitationalConstant,
            "standardGravity": standardGravity
        ]
    }
}
