import SwiftUI

struct ContentView: View {
    @State private var input = ""
    @State private var result: String = "Result"

    var body: some View {
        VStack {
            Text("CalcMate 🧮")
                .font(.largeTitle)
                .padding()

            TextField("Enter expression", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                if let calculatedResult = calculate(input) {
                    result = "Result: \(calculatedResult)"
                } else {
                    result = "Invalid input"
                }
            }) {
                Text("Calculate")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Text(result)
                .font(.headline)
                .padding()
        }
        .padding()
    }
}

// Function to evaluate expressions (same as CLI)
func calculate(_ expression: String) -> Double? {
    let trimmedExpression = expression.trimmingCharacters(in: .whitespacesAndNewlines)

    let validCharacters = CharacterSet(charactersIn: "0123456789+-*/(). ")
    if trimmedExpression.isEmpty || trimmedExpression.rangeOfCharacter(from: validCharacters.inverted) != nil {
        return nil
    }

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

#Preview {
    ContentView()
}
