import SwiftUI

struct ContentView: View {
    @State private var input = "0"
    @State private var result: String = ""

    // Define the calculator buttons
    let buttons: [[CalculatorButton]] = [
        [.function("AC"), .function("±"), .function("%"), .operation("/")],
        [.number("7"), .number("8"), .number("9"), .operation("*")],
        [.number("4"), .number("5"), .number("6"), .operation("-")],
        [.number("1"), .number("2"), .number("3"), .operation("+")],
        [.number("0"), .decimal("."), .operation("=")]
    ]

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 12) {
                Spacer()

                // Display input and result
                HStack {
                    Spacer()
                    Text(result.isEmpty ? input : result)
                        .foregroundColor(.white)
                        .font(.system(size: 64))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
                .padding()

                // Calculator buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            CalculatorButtonView(button: button) {
                                self.handleInput(button)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }

    // Handle button input
    func handleInput(_ button: CalculatorButton) {
        switch button {
        case .number(let value):
            if input == "0" || result != "" {
                input = value
                result = ""
            } else {
                input += value
            }
        case .operation(let op):
            if op == "=" {
                if let calculatedResult = calculate(input) {
                    result = "\(calculatedResult)"
                } else {
                    result = "Error"
                }
            } else {
                if "+-*/".contains(input.last ?? " ") {
                    input.removeLast()
                }
                input += op
            }
        case .function(let function):
            if function == "AC" {
                input = "0"
                result = ""
            } else if function == "±" {
                if input.first == "-" {
                    input.removeFirst()
                } else if input != "0" {
                    input = "-" + input
                }
            } else if function == "%" {
                if let value = Double(input) {
                    input = "\(value / 100)"
                }
            }
        case .decimal(let dot):
            if !input.contains(".") {
                input += dot
            }
        }
    }

    // Evaluate the expression
    func calculate(_ expression: String) -> Double? {
        let trimmedExpression = expression.trimmingCharacters(in: .whitespacesAndNewlines)
        let exp = NSExpression(format: trimmedExpression)
        if let result = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            return result.doubleValue
        } else {
            return nil
        }
    }
}

// Calculator button enum
enum CalculatorButton: Hashable {
    case number(String)
    case operation(String)
    case function(String)
    case decimal(String)

    var title: String {
        switch self {
        case .number(let value),
             .operation(let value),
             .function(let value),
             .decimal(let value):
            return value
        }
    }

    var backgroundColor: Color {
        switch self {
        case .number, .decimal:
            return Color(.darkGray)
        case .operation:
            return Color.orange
        case .function:
            return Color.gray
        }
    }
}

// Button view
struct CalculatorButtonView: View {
    let button: CalculatorButton
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(button.title)
                .font(.system(size: 32))
                .frame(width: buttonWidth(button: button), height: buttonHeight())
                .background(button.backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(buttonWidth(button: button) / 2)
        }
    }

    // Button dimensions
    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        if case .number("0") = button {
            return (UIScreen.main.bounds.width - 5 * 12) / 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }

    private func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

#Preview {
    ContentView()
}
