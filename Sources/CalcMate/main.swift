import Foundation

// Function to evaluate mathematical expressions
func calculate(_ expression: String) -> Double? {
    let trimmedExpression = expression.trimmingCharacters(in: .whitespacesAndNewlines)

    // Validate input: prevent parsing errors by checking for invalid patterns
    let validCharacters = CharacterSet(charactersIn: "0123456789+-*/(). ")
    if trimmedExpression.isEmpty || trimmedExpression.rangeOfCharacter(from: validCharacters.inverted) != nil {
        return nil
    }

    // Prevent cases like "5 +" or "3 *"
    let lastCharacter = trimmedExpression.last
    if lastCharacter == "+" || lastCharacter == "-" || lastCharacter == "*" || lastCharacter == "/" {
        return nil
    }

    do {
        let exp = NSExpression(format: trimmedExpression)
        if let result = exp.expressionValue(with: nil, context: nil) as? Double {
            return result
        }
    } catch {
        return nil
    }
    return nil
}

// Run in terminal
print("🔢 CalcMate - Terminal Calculator")
print("Enter a mathematical expression (e.g., 3 + 5 * 2) or type 'exit' to quit:")

while true {
    print("> ", terminator: "")
    if let input = readLine(), input.lowercased() != "exit" {
        if let result = calculate(input) {
            print("🧮 Result: \(result)")
        } else {
            print("❌ Invalid expression")
        }
    } else {
        print("👋 Exiting CalcMate...")
        break
    }
}
