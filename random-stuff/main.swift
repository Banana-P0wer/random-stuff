import Foundation

let letterChars = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
let digitChars = Array("0123456789")
let specialChars = Array("!@#$%^&*_-+=~")

func clearScreen() {
    print("\u{001B}[2J\u{001B}[H", terminator: "")
    fflush(stdout)
}

func randomString(length: Int, lettersWeight: Int, digitsWeight: Int, specialsWeight: Int? = nil) -> String {
    guard length > 0 else { return "" }
    let specials = max(0, specialsWeight ?? 0)
    let letters = max(0, lettersWeight)
    let digits = max(0, digitsWeight)
    let totalWeight = letters + digits + specials
    guard totalWeight > 0 else { return "" }

    return String((0..<length).map { _ in
        let roll = Int.random(in: 1...totalWeight)

        if roll <= letters {
            return letterChars.randomElement() ?? "a"
        }

        if roll <= letters + digits {
            return digitChars.randomElement() ?? "0"
        }

        return specialChars.randomElement() ?? "!"
    })
}

func randomPassword(length: Int = 25) -> String {
    return randomString(length: length, lettersWeight: 50, digitsWeight: 30, specialsWeight: 20)
}

func randomNumber(from: Int, to: Int) -> Int {
    let number = Int.random(in: (from)...(to))
    return number
}

func randomCoin() -> String {
    return Bool.random() ? "Орёл" : "Решка"
}

func randomDice(sides: Int) -> Int {
    return Int.random(in: 1...(sides))
}

func randomUUID() -> String {
    return UUID().uuidString.lowercased()
}

func randomHex(bytes: Int) -> String {
    guard bytes > 0 else { return "" }
    var result = ""
    result.reserveCapacity(bytes * 2)

    for _ in 0..<bytes {
        let byte = UInt8.random(in: 0...255)
        result += String(format: "%02x", byte)
    }

    return result
}

func randPick(_ options: [String]) -> String {
    return options.randomElement() ?? ""
}

func randShuffle(_ items: [String]) -> String {
    return items.shuffled().joined(separator: " ")
}

func randomList(min: Int, max: Int, count: Int) -> String {
    guard count > 0 else { return "" }
    let numbers = (0..<count).map { _ in Int.random(in: min...max) }
    return numbers.map(String.init).joined(separator: ", ")
}

func randomDate(fromYear: Int, toYear: Int = Calendar.current.component(.year, from: Date())) -> String {
    guard fromYear <= toYear else { return "" }

    var calendar = Calendar(identifier: .gregorian)
    calendar.timeZone = TimeZone(secondsFromGMT: 0) ?? .current

    let startComponents = DateComponents(year: fromYear, month: 1, day: 1)
    let endComponents = DateComponents(year: toYear, month: 12, day: 31, hour: 23, minute: 59, second: 59)

    guard let startDate = calendar.date(from: startComponents),
          let endDate = calendar.date(from: endComponents),
          startDate <= endDate else { return "" }

    let randomTime = TimeInterval.random(in: startDate.timeIntervalSince1970...endDate.timeIntervalSince1970)
    let date = Date(timeIntervalSince1970: randomTime)

    let formatter = DateFormatter()
    formatter.calendar = calendar
    formatter.timeZone = calendar.timeZone
    formatter.dateFormat = "dd-MM-yyyy"

    return formatter.string(from: date)
}

func randomColor() -> String {
    let red = Int.random(in: 0...255)
    let green = Int.random(in: 0...255)
    let blue = Int.random(in: 0...255)
    let hex = String(format: "#%02X%02X%02X", red, green, blue)
    return "\(hex), rgb(\(red),\(green),\(blue))"
}

clearScreen()
print("Случайная строка: \(randomString(length: 10, lettersWeight: 50, digitsWeight: 30))")
print("Случайный пароль: \(randomPassword())")
print("Случайное число: \(randomNumber(from: 1, to: 100))")
print("Случайная сторона монетки: \(randomCoin())")
print("Случайная сторона кубика: \(randomDice(sides: 6))")
print("UUID: \(randomUUID())")
print("HEX (16 bytes): \(randomHex(bytes: 16))")
print("Случайный выбор: \(randPick(["apple", "banana", "orange"]))")
print("Случайное перемешивание: \(randShuffle(["a", "b", "c", "d"]))")
print("Случайный список: \(randomList(min: 1, max: 10, count: 5))")
print("Случайная дата: \(randomDate(fromYear: 1990, toYear: 2026))")
print("Случайный цвет: \(randomColor())") 
