// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LeetCodePractice",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "Practice", targets: ["Practice"])
    ],
    targets: [
        .executableTarget(
            name: "Practice",
            path: "problems"
        ),
        .testTarget(
            name: "PracticeTests",
            dependencies: ["Practice"],
            path: "tests"
        )
    ]
)
