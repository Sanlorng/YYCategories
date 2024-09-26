// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var exclude = ["Foundation/NSObject+YYAddForARC.m", "Foundation/NSThread+YYAdd.m"]
#if os(macOS)
exclude.append(contentsOf: ["Quartz", "UIKit"])
#endif

let package = Package(
    name: "YYCategories",
    platforms: [.iOS(.v8), .macOS(.v10_11)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "YYCategories",
            targets: ["YYCategories"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "YYCategories",
            path: "YYCategories",
            exclude: exclude,
            sources: ["."],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("Foundation", .when(platforms: [.iOS, .macOS])),
                .headerSearchPath("Quartz", .when(platforms: [.iOS])),
                .headerSearchPath("UIKit", .when(platforms: [.iOS])),
                .headerSearchPath("."),
            ],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreImage"),
                .linkedFramework("CoreText"),
                .linkedFramework("ImageIO"),
                .linkedFramework("Accelerate"),
                .linkedLibrary("z")
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
