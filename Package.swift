// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EVReflection",
    platforms: [.iOS(.v9), .macOS(.v10_11), .watchOS(.v3), .tvOS(.v9)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "EVReflection",
            targets: ["EVReflection"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "EVReflection",
            dependencies: [],
            path: "Source",
            exclude: ["README.md", "Alamofire", "CloudKit", "CoreData", "Realm", "XML"]
            ),
        .testTarget(
            name: "EVReflectionTests",
            dependencies: ["EVReflection"],
            path: "UnitTests",
            exclude: [
                "AlamofireTests",
                "AlamofireXmlTests",
                "MoyaTests",
                "RealmTests",
                "CloudKit",
                "CoreDataTests",
                "EVReflectionTestData.swift",
                "EVReflectionTests/EVReflectionIssueAF39.swift",
                "EVReflectionTests/EVReflectionIssue20190117.swift",
                "RealmTestIssue219.swift",
                "RealmTestIssue221.swift",
                "coverage.png",
                "osx-Info.plist",
                "tvos-Info.plist",
                "EVReflectionTests/EVReflectionIssue124.plist",
                "EVReflectionTests/ios-Info.plist",
                "EVReflectionTests/tvos-Info.plist",
                "EVReflectionTests/osx-Info.plist",
                "README.md"
            ],
            resources: [
                .process("EVReflectionIssue20190117.json"),
                .process("EVReflectionIssue159.json"),
                .process("RealmTestIssue219.json"),
                .process("RealmTestIssue221.json"),
                .process("EVReflectionTests/EVReflectionIssue159.json"),
                .process("EVReflectionTests/EVReflectionIssue213.json"),
                .process("EVReflectionTests/sample.json"),
                .process("EVReflectionTests/EVReflectionIssue20190117.json"),
                .process("EVReflectionTests/EVReflectionIssueX.json"),
                .process("nestedArrayData_json"),
            ]
        ),
    ]
)
