// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YYCategories",
    platforms: [.macOS(.v10_13), .iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "YYCategories",
            targets: ["YYCategories"]),
    ],
    targets: [
        .target(
            name: "YYCategories",
            path: "YYCategories",
            exclude: ["Foundation/NSObject+YYAddForARC.m", "Foundation/NSThread+YYAdd.m"],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("Foundation", .when(platforms: [.iOS, .macOS])),
                .headerSearchPath("Quartz", .when(platforms: [.iOS])),
                .headerSearchPath("UIKit", .when(platforms: [.iOS])),
                .headerSearchPath("."),
            ],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
                .linkedFramework("Cocoa", .when(platforms: [.macOS])),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreImage"),
                .linkedFramework("CoreText"),
                .linkedFramework("ImageIO"),
                .linkedFramework("Accelerate"),
                .linkedLibrary("z")
            ]
        )
    ]
)
