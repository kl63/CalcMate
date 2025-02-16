# 🧮 CalcMate - Swift Calculator

![Swift](https://img.shields.io/badge/Swift-5.5-orange) ![Platform](https://img.shields.io/badge/Platform-macOS%20%7C%20iOS-blue) [![Swift Tests CI/CD](https://github.com/kl63/CalcMate/actions/workflows/swift-tests.yml/badge.svg)](https://github.com/kl63/CalcMate/actions/workflows/swift-tests.yml)

## 📌 Overview
**CalcMate** is a **Swift-based calculator** that runs in both:
- ✅ **Command Line Interface (CLI)**
- ✅ **SwiftUI App (for iOS & macOS)**
- ✅ **Automated Testing with GitHub Actions**

---

## 🚀 Features
- 📟 **CLI Calculator** (for terminal users)
- 📱 **SwiftUI Interface** (for iOS/macOS)
- ✅ **Supports addition, subtraction, multiplication, and division**
- 🛠 **Unit Tests** with `XCTest`
- 🔄 **GitHub Actions for Continuous Integration**

---

## 📦 Setup & Installation

### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/YOUR_GITHUB_USERNAME/CalcMate.git
cd CalcMate
```

### **2️⃣ Build the Project**
```sh 
swift build
```

### **3️⃣ Run the CLI Calculator**
```sh 
swift run
```

### **4️⃣ Run Unit Tests**
```sh 
swift test
```

## 🖥️ CLI Usage
```sh
🔢 CalcMate - Terminal Calculator
Enter a mathematical expression (e.g., 3 + 5 * 2) or type 'exit' to quit:
> 10 + 20 * 3
🧮 Result: 70
> exit
👋 Exiting CalcMate...
```
## 📱 SwiftUI App

### 1️⃣ Open in Xcode
To run the SwiftUI Calculator, open Xcode and create an iOS/macOS project named `CalcMateApp`.  
Use `ContentView.swift` to integrate the SwiftUI interface.

### 2️⃣ Run the App
- Press `Cmd + R` in Xcode.  
- The app will display a simple calculator UI with a text field and a "Calculate" button.

## 🎥 Demo
Check out a quick preview of **CalcMate** in action:

![CalcMate Demo](/CalcMate_Demo.gif)


## ✅ Automated Testing (GitHub Actions)
This project includes GitHub Actions to automatically run tests on each push and pull request.

### CI/CD Workflow
- 🛠 Runs `swift build` and `swift test` on GitHub  
- ✅ Ensures code works before merging  
- 🚀 Prevents breaking changes in `main` branch  

## 🚀 GitHub Actions Setup

The workflow file is located at `.github/workflows/swift-tests.yml`:

```yaml
name: Swift Tests

on:
  push:
    branches:
      - main
      - development
  pull_request:
    branches:
      - main
      - development

jobs:
  test:
    runs-on: macos-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Install Swift (if needed)
        run: |
          swift --version

      - name: Build the Project
        run: swift build

      - name: Run Tests
        run: swift test
```
## 🔍 View Actions in GitHub
1. Go to your repository  
2. Click **Actions**  
3. See **Swift Tests** running automatically! 🎉  

## 👨‍💻 Contributing
Want to improve **CalcMate**? Feel free to:  
- 🛠 Open an **issue** for bugs/features  
- 📝 Submit a **pull request** with improvements  

## ⚖️ License
This project is open-source under the **MIT License**.  

## ✨ Author
Created by **Kevin Lin** 🚀  
🔗 [GitHub](https://github.com/kl63)  
