// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "CalcMate",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "CalcMate", targets: ["CalcMate"]),
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "CalcMate",
            dependencies: []
        ),
        .testTarget(
            name: "CalcMateTests",
            dependencies: ["CalcMate"]
        ),
    ]
)
