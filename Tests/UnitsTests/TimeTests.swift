import Testing
@testable import Units

@Suite("Time Unit Tests")
struct TimeTests {
    @Test("Minutes to seconds conversion")
    func minutesToSeconds() {
        let oneMinute = 1.0.minutes
        let inSeconds = oneMinute.converted(to: .seconds)

        #expect(inSeconds.value == 60.0)
    }

    @Test("Hours to minutes conversion")
    func hoursToMinutes() {
        let oneHour = 1.0.hours
        let inMinutes = oneHour.converted(to: .minutes)

        #expect(inMinutes.value == 60.0)
    }

    @Test("Days to hours conversion")
    func daysToHours() {
        let oneDay = 1.0.days
        let inHours = oneDay.converted(to: .hours)

        #expect(inHours.value == 24.0)
    }

    @Test("Weeks to days conversion")
    func weeksToDays() {
        let oneWeek = 1.0.weeks
        let inDays = oneWeek.converted(to: .days)

        #expect(inDays.value == 7.0)
    }

    @Test("Years to days conversion")
    func yearsToDays() {
        let oneYear = 1.0.years
        let inDays = oneYear.converted(to: .days)

        #expect(abs(inDays.value - 365.25) < 0.0001)
    }

    @Test("Milliseconds conversion")
    func milliseconds() {
        let oneSecond = 1000.0.milliseconds
        let inSeconds = oneSecond.converted(to: .seconds)

        #expect(inSeconds.value == 1.0)
    }

    @Test("Microseconds conversion")
    func microseconds() {
        let oneSecond = 1_000_000.0.microseconds
        let inSeconds = oneSecond.converted(to: .seconds)

        #expect(abs(inSeconds.value - 1.0) < 0.0001)
    }

    @Test("Nanoseconds conversion")
    func nanoseconds() {
        let oneSecond = 1_000_000_000.0.nanoseconds
        let inSeconds = oneSecond.converted(to: .seconds)

        #expect(abs(inSeconds.value - 1.0) < 0.0001)
    }

    @Test("Addition of times")
    func addition() {
        let result = 1.0.hours + 30.0.minutes
        #expect(result.value == 1.5)
        #expect(result.unit == .hours)
    }

    @Test("Subtraction of times")
    func subtraction() {
        let result = 2.0.hours - 30.0.minutes
        #expect(result.value == 1.5)
        #expect(result.unit == .hours)
    }

    @Test("Comparison")
    func comparison() {
        #expect(60.0.seconds == 1.0.minutes)
        #expect(90.0.seconds > 1.0.minutes)
        #expect(30.0.seconds < 1.0.minutes)
    }

    @Test("Description")
    func description() {
        let time = 3.5.hours
        #expect(time.description == "3.5 h")
    }
}
