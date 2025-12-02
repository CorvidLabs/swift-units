import Units

// MARK: - Length Examples

func lengthExamples() {
    // Basic conversions
    let marathon = 42.195.kilometers
    let inMiles = marathon.converted(to: .miles)
    print("Marathon distance: \(inMiles)")

    // Arithmetic
    let totalDistance = 5.kilometers + 2500.meters
    print("Total: \(totalDistance)")

    // Comparisons
    if 1000.meters == 1.kilometers {
        print("Equal distances")
    }
}

// MARK: - Mass Examples

func massExamples() {
    // Conversions
    let bodyWeight = 165.pounds
    let inKg = bodyWeight.converted(to: .kilograms)
    print("Weight: \(inKg)")

    // Adding different units
    let total = 2.kilograms + 500.grams
    print("Total mass: \(total)")

    // Stone conversion (UK)
    let weight = 11.stones
    print("In pounds: \(weight.converted(to: .pounds))")
}

// MARK: - Temperature Examples

func temperatureExamples() {
    // Classic conversions
    let waterBoiling = 100.celsius
    print("Boiling point: \(waterBoiling.converted(to: .fahrenheit))")

    let absoluteZero = 0.kelvin
    print("Absolute zero in Celsius: \(absoluteZero.converted(to: .celsius))")

    // Temperature differences
    let temp1 = 20.celsius
    let temp2 = 25.celsius
    let difference = temp2 - temp1
    print("Temperature difference: \(difference)")

    // Comparisons work across units
    if 32.fahrenheit == 0.celsius {
        print("Freezing point")
    }
}

// MARK: - Time Examples

func timeExamples() {
    // Various time units
    let workDay = 8.hours
    let inMinutes = workDay.converted(to: .minutes)
    print("Work day: \(inMinutes)")

    // Adding time
    let meeting = 1.hours + 30.minutes
    print("Meeting duration: \(meeting)")

    // Precise timing
    let millisecond = 1.milliseconds
    let microseconds = millisecond.converted(to: .microseconds)
    print("1ms = \(microseconds)")

    // Years to days
    let year = 1.years
    print("Days in year: \(year.converted(to: .days))")
}

// MARK: - Data Examples

func dataExamples() {
    // Decimal (SI) units
    let downloadSize = 150.megabytes
    print("Download: \(downloadSize)")

    // Binary (IEC) units
    let ramSize = 16.gibibytes
    let inMebibytes = ramSize.converted(to: .mebibytes)
    print("RAM: \(inMebibytes)")

    // Comparing decimal vs binary
    let decimalGB = 1.gigabytes
    let binaryGB = 1.gibibytes
    if binaryGB > decimalGB {
        print("1 GiB is larger than 1 GB")
    }

    // Total storage calculation
    let file1 = 2.5.gigabytes
    let file2 = 500.megabytes
    let total = file1 + file2
    print("Total storage: \(total)")
}

// MARK: - Physical Constants Examples

func physicsExamples() {
    // Using mathematical constants
    let radius = 5.0
    let circumference = 2 * PhysicalConstants.pi * radius
    print("Circumference: \(circumference)")

    // Speed of light calculations
    let lightSpeed = PhysicalConstants.speedOfLight
    let timeSeconds = 1.0
    let distanceTraveled = lightSpeed * timeSeconds
    print("Light travels \(distanceTraveled) meters in 1 second")

    // Working with constants
    print("Avogadro's number: \(PhysicalConstants.avogadroConstant)")
    print("Planck constant: \(PhysicalConstants.planckConstant)")
    print("Gravitational constant: \(PhysicalConstants.gravitationalConstant)")

    // Access grouped constants
    let mathConstants = PhysicalConstants.mathematicalConstants
    print("Pi from dictionary: \(mathConstants["pi"] ?? 0)")
}

// MARK: - Real-world Scenarios

func realWorldExamples() {
    // Trip planning
    let tripDistance = 250.miles
    let fuelEfficiency = 30.0 // miles per gallon
    let gallonsNeeded = tripDistance.value / fuelEfficiency
    print("Fuel needed: \(gallonsNeeded) gallons")

    // Cooking
    let recipe = 2.pounds
    let inGrams = recipe.converted(to: .grams)
    print("Recipe calls for: \(inGrams)")

    // Weather
    let temperature = 72.fahrenheit
    let inCelsius = temperature.converted(to: .celsius)
    print("Today's temperature: \(inCelsius)")

    // Athletics
    let sprint = 100.meters
    let time = 9.58 // seconds (Usain Bolt's world record)
    let speed = sprint.value / time
    print("Average speed: \(speed) m/s")

    // Data transfer
    let fileSize = 4.5.gigabytes
    let bandwidth = 100.megabytes // per second
    let transferTime = fileSize.converted(to: .megabytes).value / bandwidth.value
    print("Transfer time: \(transferTime) seconds")
}

// MARK: - Type Safety Examples

func typeSafetyExamples() {
    // Different measurement types cannot be mixed
    let length: Length = 10.meters
    let mass: Mass = 5.kilograms
    let time: Time = 2.seconds
    let temp: Temperature = 25.celsius
    let data: DataSize = 100.megabytes

    // This demonstrates strong typing
    print("Length: \(length)")
    print("Mass: \(mass)")
    print("Time: \(time)")
    print("Temperature: \(temp)")
    print("Data: \(data)")

    // Each type can only be combined with its own type
    let totalLength = length + 5.meters  // ✓ Works
    print("Total length: \(totalLength)")

    let totalMass = mass + 2.kilograms   // ✓ Works
    print("Total mass: \(totalMass)")

    // let invalid = length + mass       // ✗ Compiler error
}

// MARK: - Advanced Usage

func advancedExamples() {
    // Chaining conversions
    let distance = 5000.meters
        .converted(to: .kilometers)
        .converted(to: .miles)
    print("5000m in miles: \(distance)")

    // Complex calculations
    let speed = 60.0 // km/h
    let time = 2.5.hours
    let distanceTraveled = speed * time.value
    print("Distance traveled: \(distanceTraveled) km")

    // Comparison chains
    let measurements: [Length] = [
        100.meters,
        0.1.kilometers,
        328.feet,
        109.yards
    ]

    let sorted = measurements.sorted()
    print("Sorted distances: \(sorted)")

    // Using base values for custom calculations
    let m1 = 10.kilograms
    let m2 = 5.kilograms
    let ratio = m1.baseValue / m2.baseValue
    print("Mass ratio: \(ratio)")
}

// MARK: - Main

print("=== Length Examples ===")
lengthExamples()

print("\n=== Mass Examples ===")
massExamples()

print("\n=== Temperature Examples ===")
temperatureExamples()

print("\n=== Time Examples ===")
timeExamples()

print("\n=== Data Examples ===")
dataExamples()

print("\n=== Physics Examples ===")
physicsExamples()

print("\n=== Real-world Examples ===")
realWorldExamples()

print("\n=== Type Safety Examples ===")
typeSafetyExamples()

print("\n=== Advanced Examples ===")
advancedExamples()
