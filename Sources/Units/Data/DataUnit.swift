/**
 Units of data/information storage measurement.

 Supports both decimal (SI) and binary (IEC) prefixes.
 - Decimal: KB = 1000 bytes, MB = 1000 KB, etc.
 - Binary: KiB = 1024 bytes, MiB = 1024 KiB, etc.
 */
public enum DataUnit: Sendable, Hashable {
    /// Bytes (base unit)
    case bytes

    /// Bits
    case bits

    // MARK: - Decimal (SI) Units

    /// Kilobytes (1000 bytes)
    case kilobytes

    /// Megabytes (1000 kilobytes)
    case megabytes

    /// Gigabytes (1000 megabytes)
    case gigabytes

    /// Terabytes (1000 gigabytes)
    case terabytes

    /// Petabytes (1000 terabytes)
    case petabytes

    // MARK: - Binary (IEC) Units

    /// Kibibytes (1024 bytes)
    case kibibytes

    /// Mebibytes (1024 kibibytes)
    case mebibytes

    /// Gibibytes (1024 mebibytes)
    case gibibytes

    /// Tebibytes (1024 gibibytes)
    case tebibytes

    /// Pebibytes (1024 tebibytes)
    case pebibytes
}

// MARK: - Unit Conformance

extension DataUnit: Unit {
    public static let baseUnit: DataUnit = .bytes

    public var symbol: String {
        switch self {
        case .bytes: return "B"
        case .bits: return "b"
        case .kilobytes: return "KB"
        case .megabytes: return "MB"
        case .gigabytes: return "GB"
        case .terabytes: return "TB"
        case .petabytes: return "PB"
        case .kibibytes: return "KiB"
        case .mebibytes: return "MiB"
        case .gibibytes: return "GiB"
        case .tebibytes: return "TiB"
        case .pebibytes: return "PiB"
        }
    }

    public var description: String {
        symbol
    }

    public func toBaseUnit(_ value: Double) -> Double {
        switch self {
        case .bytes:
            return value
        case .bits:
            return value / 8.0
        case .kilobytes:
            return value * 1000.0
        case .megabytes:
            return value * 1_000_000.0
        case .gigabytes:
            return value * 1_000_000_000.0
        case .terabytes:
            return value * 1_000_000_000_000.0
        case .petabytes:
            return value * 1_000_000_000_000_000.0
        case .kibibytes:
            return value * 1024.0
        case .mebibytes:
            return value * 1_048_576.0
        case .gibibytes:
            return value * 1_073_741_824.0
        case .tebibytes:
            return value * 1_099_511_627_776.0
        case .pebibytes:
            return value * 1_125_899_906_842_624.0
        }
    }

    public func fromBaseUnit(_ value: Double) -> Double {
        switch self {
        case .bytes:
            return value
        case .bits:
            return value * 8.0
        case .kilobytes:
            return value / 1000.0
        case .megabytes:
            return value / 1_000_000.0
        case .gigabytes:
            return value / 1_000_000_000.0
        case .terabytes:
            return value / 1_000_000_000_000.0
        case .petabytes:
            return value / 1_000_000_000_000_000.0
        case .kibibytes:
            return value / 1024.0
        case .mebibytes:
            return value / 1_048_576.0
        case .gibibytes:
            return value / 1_073_741_824.0
        case .tebibytes:
            return value / 1_099_511_627_776.0
        case .pebibytes:
            return value / 1_125_899_906_842_624.0
        }
    }
}

// MARK: - Convenience Type Aliases

public typealias DataSize = Measurement<DataUnit>

// MARK: - Numeric Extensions

extension BinaryInteger {
    /// Creates a data measurement in bytes.
    public var bytes: DataSize {
        DataSize(value: Double(self), unit: .bytes)
    }

    /// Creates a data measurement in bits.
    public var bits: DataSize {
        DataSize(value: Double(self), unit: .bits)
    }

    /// Creates a data measurement in kilobytes (decimal, 1000 bytes).
    public var kilobytes: DataSize {
        DataSize(value: Double(self), unit: .kilobytes)
    }

    /// Creates a data measurement in megabytes (decimal).
    public var megabytes: DataSize {
        DataSize(value: Double(self), unit: .megabytes)
    }

    /// Creates a data measurement in gigabytes (decimal).
    public var gigabytes: DataSize {
        DataSize(value: Double(self), unit: .gigabytes)
    }

    /// Creates a data measurement in terabytes (decimal).
    public var terabytes: DataSize {
        DataSize(value: Double(self), unit: .terabytes)
    }

    /// Creates a data measurement in petabytes (decimal).
    public var petabytes: DataSize {
        DataSize(value: Double(self), unit: .petabytes)
    }

    /// Creates a data measurement in kibibytes (binary, 1024 bytes).
    public var kibibytes: DataSize {
        DataSize(value: Double(self), unit: .kibibytes)
    }

    /// Creates a data measurement in mebibytes (binary).
    public var mebibytes: DataSize {
        DataSize(value: Double(self), unit: .mebibytes)
    }

    /// Creates a data measurement in gibibytes (binary).
    public var gibibytes: DataSize {
        DataSize(value: Double(self), unit: .gibibytes)
    }

    /// Creates a data measurement in tebibytes (binary).
    public var tebibytes: DataSize {
        DataSize(value: Double(self), unit: .tebibytes)
    }

    /// Creates a data measurement in pebibytes (binary).
    public var pebibytes: DataSize {
        DataSize(value: Double(self), unit: .pebibytes)
    }
}

extension BinaryFloatingPoint {
    /// Creates a data measurement in bytes.
    public var bytes: DataSize {
        DataSize(value: Double(self), unit: .bytes)
    }

    /// Creates a data measurement in bits.
    public var bits: DataSize {
        DataSize(value: Double(self), unit: .bits)
    }

    /// Creates a data measurement in kilobytes (decimal, 1000 bytes).
    public var kilobytes: DataSize {
        DataSize(value: Double(self), unit: .kilobytes)
    }

    /// Creates a data measurement in megabytes (decimal).
    public var megabytes: DataSize {
        DataSize(value: Double(self), unit: .megabytes)
    }

    /// Creates a data measurement in gigabytes (decimal).
    public var gigabytes: DataSize {
        DataSize(value: Double(self), unit: .gigabytes)
    }

    /// Creates a data measurement in terabytes (decimal).
    public var terabytes: DataSize {
        DataSize(value: Double(self), unit: .terabytes)
    }

    /// Creates a data measurement in petabytes (decimal).
    public var petabytes: DataSize {
        DataSize(value: Double(self), unit: .petabytes)
    }

    /// Creates a data measurement in kibibytes (binary, 1024 bytes).
    public var kibibytes: DataSize {
        DataSize(value: Double(self), unit: .kibibytes)
    }

    /// Creates a data measurement in mebibytes (binary).
    public var mebibytes: DataSize {
        DataSize(value: Double(self), unit: .mebibytes)
    }

    /// Creates a data measurement in gibibytes (binary).
    public var gibibytes: DataSize {
        DataSize(value: Double(self), unit: .gibibytes)
    }

    /// Creates a data measurement in tebibytes (binary).
    public var tebibytes: DataSize {
        DataSize(value: Double(self), unit: .tebibytes)
    }

    /// Creates a data measurement in pebibytes (binary).
    public var pebibytes: DataSize {
        DataSize(value: Double(self), unit: .pebibytes)
    }
}
