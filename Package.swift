// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
      targets: ["FirebaseABTestingTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheckTarget"]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: ["FirebaseAppDistributionTarget"]
    ),
    .library(
      name: "FirebaseAuth",
      targets: ["FirebaseAuthTarget"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlyticsTarget"]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: ["FirebaseDatabaseTarget"]
    ),
    .library(
      name: "FirebaseDynamicLinks",
      targets: ["FirebaseDynamicLinksTarget"]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: ["FirebaseFirestoreTarget"]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: ["FirebaseFunctionsTarget"]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: ["FirebaseInAppMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformanceTarget"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfigTarget"]
    ),
    .library(
      name: "FirebaseStorage",
      targets: ["FirebaseStorageTarget"]
    ),
    .library(
      name: "Google-Mobile-Ads-SDK",
      targets: ["Google-Mobile-Ads-SDKTarget"]
    ),
    .library(
      name: "GoogleSignIn",
      targets: ["GoogleSignInTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./"
    ),
    .target(
      name: "FirebaseABTestingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseCore",
        "FirebaseCoreDiagnostics",
        "FirebaseInstallations",
        "GoogleAppMeasurement",
        "GoogleAppMeasurementIdentitySupport",
        "GoogleDataTransport",
        "GoogleUtilities",
        "PromisesObjC",
        "nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheck"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAuth",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseCrashlytics"
      ],
      path: "Sources/FirebaseCrashlytics",
      exclude: [
        "run",
        "upload-symbols"
      ]
    ),
    .target(
      name: "FirebaseDatabaseTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseDatabase",
        "leveldb-library"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "BoringSSL-GRPC",
        "FirebaseFirestore",
        "Libuv-gRPC",
        "abseil",
        "gRPC-C++",
        "gRPC-Core",
        "leveldb-library"
      ],
      path: "Sources/FirebaseFirestore",
      resources: [
        .process("Resources/gRPCCertificates-Cpp.bundle")
      ]
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseFunctions",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging",
      resources: [
        .process("Resources/InAppMessagingDisplayResources.bundle")
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMLModelDownloader",
        "SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMessaging"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        "FirebaseRemoteConfig"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseStorage",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "GTMAppAuth", condition: .when(platforms: [.iOS])),
        "GTMSessionFetcher",
        .target(name: "GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      resources: [
        .process("Resources/GoogleSignIn.bundle")
      ]
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/AppAuth.xcframework.zip",
      checksum: "7e5a83244b7dce8d8ffc31f38b22cf157a11a5d8dadf0e720e6d0e25ecadb6e0"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "ced8438290f362535596932364e42f082232e49984500a0b9eedb15bc1882ee3"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseABTesting.xcframework.zip",
      checksum: "c9bbf3a168a9e77a423b6097108877d7b29f510c2b3872fb109da5a447682c6c"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseAnalytics.xcframework.zip",
      checksum: "ad2b113407e102f9be7d02042ed8b4cccd0b3c5a63d84c0f6efea5a034c9223d"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseAppCheck.xcframework.zip",
      checksum: "d0979233eb51d67dcdd426b9d5244e87aca3a410d5b32a8f440c2714021baec5"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "f8defedb7e1820229622f33e36e84a07c4864c351c3839bf6a478572c765e4bc"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseAuth.xcframework.zip",
      checksum: "8d293e4ca937d6da190c3e4ea5414cd577f11fed5262eb4c22f96167236e66e1"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseCore.xcframework.zip",
      checksum: "27fa6c45d02881cecdcb99c414061b59509ab05f2c15c684b110070d646b8ab8"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "0a05b064156f1dec050232642b4338a7f3ab701148efc3b2abff0a40868b63ac"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "f25ca6646385416e1d43dd8d811feba1996755af750ae467de1be7dd3032ae51"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseDatabase.xcframework.zip",
      checksum: "0fb003c6eb3964027fee215b822857486b31b77d6e2bcb9910578f3b93d3ec7e"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "83d6aae20954013255b39b307be0a1641e133e34adc286591ff9d221d12d5aae"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseFirestore.xcframework.zip",
      checksum: "65b4287c488954ffe0b6f20c408c442a6da81b80b2ec9750cf7cfc35a3f8195e"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseFunctions.xcframework.zip",
      checksum: "6a5a841ef5cd8795f3a65a6dad2ca239f918ae0aace8deeee5a83e45e983c847"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "d206e4301237d7291b69643ea4fc38b620113f022cd25cc8f7b883fb8d08e6c8"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseInstallations.xcframework.zip",
      checksum: "dce04da73db8e8c187c99a0d47bf3e959af90aa28dc34cf9d7aba80f34206321"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "df5a09d1108144c82052ddffce9fcd891ea17631ed8e0679dbe04e9d59fdaaef"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseMessaging.xcframework.zip",
      checksum: "8db5982e48f528cb387017b6fa201994e58d44bdceb226c3f71234c910212f7a"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebasePerformance.xcframework.zip",
      checksum: "29fa8e05a382e4ed95ac0b3ed5efce027daf7167801ca38469f4c41bf0aef302"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "405b496556921a5d8d50083df0651a3e95181143265d990096786278561149cb"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseStorage.xcframework.zip",
      checksum: "66767faeec6372003cac56e8e13cd70d8d1435aec2a80b081394187e748c2c2c"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GTMAppAuth.xcframework.zip",
      checksum: "8fc5f9d04099aacb1ed9434f77f583ead9821219aad5a2e5ccbad5e7bf9ace8b"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GTMSessionFetcher.xcframework.zip",
      checksum: "80e83c15ee3f5abe685916424547e228ea10036d5ac8b9df5aab452f63ec0ee5"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "d76208226b49a07554e0d7433fc65280a04126f758a4fcdc608a51ab717d1590"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "6813ed5870c6d4052b2ea24f7b39e59f75df2f355dce8bf62e762a65d4cbb305"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GoogleDataTransport.xcframework.zip",
      checksum: "abab94266354c07166279cb2a97e29c6a36ba49ec12e5ea0176c1856eb315364"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GoogleMobileAds.xcframework.zip",
      checksum: "7c025fc9474fc1613cbbe26126fa319848cfc8eb293dabcf845451940ba56e04"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GoogleSignIn.xcframework.zip",
      checksum: "038580bc5c56edb6e7b2f6b587b6fc717b714a6905c7960b87ac48e38e385f26"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GoogleUtilities.xcframework.zip",
      checksum: "495998aea5218be7377018a6458f3a44f92adb1f478c78fbfe3a6213be3fa5b2"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/Libuv-gRPC.xcframework.zip",
      checksum: "92e0644380452a8388d32fbf71b92229966f297c205351ec0241e6a3ed5f78c2"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/PromisesObjC.xcframework.zip",
      checksum: "66e33c86aa4b3f560a705f82888cfcbe1557701aba582b5702d85f56b21824aa"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/SwiftProtobuf.xcframework.zip",
      checksum: "0cde435090b2336e6889b698be3c13857b89f9aef5f175f4f18d80d8e20bed24"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/UserMessagingPlatform.xcframework.zip",
      checksum: "b10f46373ee937bf61d34fead456c396dd44699599a430d8d1ec8785096f0bb3"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/abseil.xcframework.zip",
      checksum: "b2884adcee8bb7ca79506c5630ae63c15781cbfa47e5a36963c43bfb76ececdd"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/gRPC-C++.xcframework.zip",
      checksum: "f3868384d5f411fc3064bd886bcbf466b68edbb4e712c803dfe2ade41ddbacc3"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/gRPC-Core.xcframework.zip",
      checksum: "41bca0027a9347a499f17de934f5db772d0568ca790d96b20bfd4a093f01ebad"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/leveldb-library.xcframework.zip",
      checksum: "231ef379e653c72d019338761db27a624d890daa072a645029da53ee381277f8"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/nanopb.xcframework.zip",
      checksum: "720efd8d841c3cd4d8aa71127ab66c234cbe315b172318b6a36a1fbdce090f0c"
    )
  ]
)
    