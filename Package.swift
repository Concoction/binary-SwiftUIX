// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-SwiftUIX/raw/1.0.9002/"
let modules = []

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
    ]
)
