// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-SwiftUIX/raw/1.0.9003/"
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
            checksum: "7ef0e9ca0653fcf3792a5c2580332120abbc9876c62aff251f3691d16a4d8924"
        ),
        .binaryTarget(
            name: "_SwiftUIX",
            url: repo + "_SwiftUIX.xcframework.zip",
            checksum: "03bdcb39832b7840458ff7356429421799157f607b0825b3b8959c6ca9f72c61"
        ),
    ]
)
