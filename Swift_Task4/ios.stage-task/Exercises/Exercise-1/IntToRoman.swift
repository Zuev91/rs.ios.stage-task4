import Foundation

public extension Int {
    
    var roman: String? {
        var number = self
        var result = Array<String>()
        var buffer = 0
        if (1 ... 3999).contains(number) {
                if (number / 1000 != 0 ) {
                    buffer = number / 1000
                    let i = Array(repeating: "M", count: buffer)
                    result.append(contentsOf: i)
                    number -= buffer * 1000
                }
                if (number / 100 != 0 ) {
                    buffer = number / 100
                    if buffer == 4 {
                        result.append("CD")
                        number -= buffer * 100
                    } else if buffer == 9 {
                        result.append("CM")
                        number -= buffer * 100
                    } else if buffer == 5 {
                        result.append("D")
                        number -= buffer * 100
                    } else if (6 ... 8).contains(buffer) {
                        result.append("D")
                        let i = Array(repeating: "C", count: buffer - 5)
                        result.append(contentsOf: i)
                        number -= buffer * 100
                    } else {
                        let i = Array(repeating: "C", count: buffer)
                        result.append(contentsOf: i)
                        number -= buffer * 100
                    }
                }
                if (number / 10 != 0 ) {
                    buffer = number / 10
                    if buffer == 4 {
                        result.append("XL")
                        number -= buffer * 10
                    } else if buffer == 9 {
                        result.append("XC")
                        number -= buffer * 10
                    } else if buffer == 5 {
                        result.append("L")
                        number -= buffer * 10
                    } else if (6 ... 8).contains(buffer) {
                        result.append("L")
                        let i = Array(repeating: "X", count: buffer - 5)
                        result.append(contentsOf: i)
                        number -= buffer * 10
                    } else {
                        let i = Array(repeating: "X", count: buffer)
                        result.append(contentsOf: i)
                        number -= buffer * 10
                    }
                }
                if (number != 0 ) {
                    buffer = number
                    switch buffer {
                    case 1 ... 3: result.append(contentsOf: Array(repeating: "I", count: buffer))
                    case 4: result.append("IV")
                    case 5: result.append("V")
                    case 6 ... 8: result.append("V")
                        result.append(contentsOf: Array(repeating: "I", count: buffer - 5))
                    case 9: result.append("IX")
                    default:
                        fatalError("number is not expected")
                    }
                }
            let final = result.joined(separator:"")
            return final
        }
        else { return nil }
    }
}
