import Testing
@testable import Units

@Suite("Data Unit Tests")
struct DataTests {
    @Test("Bytes to bits conversion")
    func bytesToBits() {
        let oneByte = 1.0.bytes
        let inBits = oneByte.converted(to: .bits)

        #expect(inBits.value == 8.0)
    }

    @Test("Kilobytes to bytes (decimal)")
    func kilobytesToBytes() {
        let oneKilobyte = 1.0.kilobytes
        let inBytes = oneKilobyte.converted(to: .bytes)

        #expect(inBytes.value == 1000.0)
    }

    @Test("Kibibytes to bytes (binary)")
    func kibibytesToBytes() {
        let oneKibibyte = 1.0.kibibytes
        let inBytes = oneKibibyte.converted(to: .bytes)

        #expect(inBytes.value == 1024.0)
    }

    @Test("Megabytes conversion (decimal)")
    func megabytes() {
        let oneMegabyte = 1.0.megabytes
        let inBytes = oneMegabyte.converted(to: .bytes)

        #expect(inBytes.value == 1_000_000.0)
    }

    @Test("Mebibytes conversion (binary)")
    func mebibytes() {
        let oneMebibyte = 1.0.mebibytes
        let inBytes = oneMebibyte.converted(to: .bytes)

        #expect(inBytes.value == 1_048_576.0)
    }

    @Test("Gigabytes conversion (decimal)")
    func gigabytes() {
        let oneGigabyte = 1.0.gigabytes
        let inBytes = oneGigabyte.converted(to: .bytes)

        #expect(inBytes.value == 1_000_000_000.0)
    }

    @Test("Gibibytes conversion (binary)")
    func gibibytes() {
        let oneGibibyte = 1.0.gibibytes
        let inBytes = oneGibibyte.converted(to: .bytes)

        #expect(inBytes.value == 1_073_741_824.0)
    }

    @Test("Terabytes conversion (decimal)")
    func terabytes() {
        let oneTerabyte = 1.0.terabytes
        let inBytes = oneTerabyte.converted(to: .bytes)

        #expect(inBytes.value == 1_000_000_000_000.0)
    }

    @Test("Tebibytes conversion (binary)")
    func tebibytes() {
        let oneTebibyte = 1.0.tebibytes
        let inBytes = oneTebibyte.converted(to: .bytes)

        #expect(inBytes.value == 1_099_511_627_776.0)
    }

    @Test("Decimal vs Binary comparison")
    func decimalVsBinary() {
        let decimal = 1.0.kilobytes
        let binary = 1.0.kibibytes

        #expect(binary.converted(to: .bytes).value > decimal.converted(to: .bytes).value)
    }

    @Test("Addition of data sizes")
    func addition() {
        let result = 1.0.megabytes + 500.0.kilobytes
        #expect(result.value == 1.5)
        #expect(result.unit == .megabytes)
    }

    @Test("Comparison")
    func comparison() {
        #expect(1024.0.bytes == 1.0.kibibytes)
        #expect(1000.0.bytes == 1.0.kilobytes)
        #expect(1.0.mebibytes > 1.0.megabytes)
    }

    @Test("Description")
    func description() {
        let size = 512.0.megabytes
        #expect(size.description == "512.0 MB")
    }
}
