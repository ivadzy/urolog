// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
      name: "Urolog"
    , platforms: [
        .iOS(SupportedPlatform.IOSVersion.v10)
        , .macOS(SupportedPlatform.MacOSVersion.v10_13)
      ]
    , products: [
        .library(
              name: "Urolog"
            , type: .static
            , targets: ["Urolog"]
        )
        ,
      ]
    , dependencies: []
    , targets: [
        .target(
              name: "Urolog"
            , dependencies: []
        )
        , .testTarget(
              name: "UrologTests"
            , dependencies: ["Urolog"]
          )
        ,
    ]
)
