// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-SwiftUIX/raw/1.0.9001/"
let modules = ["SwiftUIX", "_SwiftUIX"]

let package = Package(
    name: "SwiftUIX",

    platforms: [
        .iOS(.v13),
        .macOS(.v11),
        .tvOS(.v13),
        .watchOS(.v6)
    ],

    products: modules.map {
      .library(name: $0, type: .static, targets: [$0, "SwiftUIX_Binder"]
    ) },


    targets: [
        .target(name: "SwiftUIX_Binder", dependencies: modules.map { .target(name: $0) }),
        .binaryTarget(
            name: "SwiftUIX",
            url: repo + "SwiftUIX.xcframework.zip",
            checksum: "df750a6cbbbf7af504480f3ff1cb9770202c4eace35b4925fffc7adb1eff95a4"
        ),
        .binaryTarget(
            name: "_SwiftUIX",
            url: repo + "_SwiftUIX.xcframework.zip",
            checksum: "8576947ef2b2daaddd41d6a26c84ae9e4769b45423a8253398864d55783cde9e"
        ),
    ]
)
