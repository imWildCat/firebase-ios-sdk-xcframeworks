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
      name: "FirebaseAnalyticsOnDeviceConversion",
      targets: ["FirebaseAnalyticsOnDeviceConversionTarget"]
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
        "FirebaseAnalyticsSwift",
        "FirebaseCore",
        "FirebaseCoreDiagnostics",
        "FirebaseCoreInternal",
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
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
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
        "FirebaseDatabaseSwift",
        "FirebaseSharedSwift",
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
        "FirebaseFirestoreSwift",
        "Libuv-gRPC",
        "abseil",
        "gRPC-C++",
        "gRPC-Core",
        "leveldb-library"
      ],
      path: "Sources/FirebaseFirestore",
      exclude: [
        "Resources"
      ]
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheckInterop",
        "FirebaseAuthInterop",
        "FirebaseCoreExtension",
        "FirebaseFunctions",
        "FirebaseMessagingInterop",
        "FirebaseSharedSwift",
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
        .target(name: "FirebaseInAppMessaging", condition: .when(platforms: [.iOS])),
        .target(name: "FirebaseInAppMessagingSwift", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging",
      exclude: [
        "Resources"
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
        "FirebaseRemoteConfig",
        "FirebaseRemoteConfigSwift",
        "FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheckInterop",
        "FirebaseAuthInterop",
        "FirebaseCoreExtension",
        "FirebaseStorage",
        "FirebaseStorageInternal",
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
      exclude: [
        "Resources"
      ]
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/AppAuth.xcframework.zip",
      checksum: "34ad2545539a1665747585f14cf409af1ee8b16863ade5b1179ad1812c2c6447"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "180fd85f58e64fa93235f257160b8d31906dd3108f580aa4fd23f21151e25976"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseABTesting.xcframework.zip",
      checksum: "850f34699c6ba286192eaa4f6d2dc45f57119efdcb0efd4f36b6deeb91d0175e"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAnalytics.xcframework.zip",
      checksum: "f9d125384ada98cae3f8221f504e1bb9f8fb9fcd29f51480541e53d3ed9c6c66"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "b1d6f9334f39e00d39bd9aef14d474d514d22800c16b08af4a5e5d3314ee559a"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "7a063a65d353a6c4a80a6f2c7999c192d646fd681438bac142a2c8a16b910478"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAppCheck.xcframework.zip",
      checksum: "918aa56ae975cb6b326508e3cc1e5c04f0b61e4d82d5ea19660f3e17f7116308"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "7e6a03946c53e732e63a8a969c7b9a37093012fa01c471a3e0f3234a9f653e1d"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "93d0cb6549ae8fb3014be52af76005fded6cef55874d631d868c0d1961c91f20"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAuth.xcframework.zip",
      checksum: "d4ba066c48923fb0c36d6108687f38a8f3bda76d2e41776af51bcf9089d9ce16"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "9f9341c89a541406806af6f5050305cfa4b0819e5e281f56e1d64a7ebf0e96c7"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseCore.xcframework.zip",
      checksum: "4f2ffd851c5351a51960ac4e032d8ec17f5978287cec178405419f00dadfd0ac"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "8d52fcfdaebbc7dc3852bd34e7341c854a95b5c37927ab101235c8c25dbd69c5"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "ebbdf2ae0895d98f25867e3d38abc532c83dd9ca79bdd0a8f64fd07d2f875ea3"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "8ece799779360d6680a0160836d1cffec95e34b8ebec1458370978627cb752bf"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "a2705c0cbb87434a69edd35cabf1d5539347085ff95e758b9eb5f5b927e1c6fd"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseDatabase.xcframework.zip",
      checksum: "6d0f2850a9d4dc48a11edcdf2ec4730a41ed1099597d8996ac4738023bb3cd7a"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "52c6bd8c0ebe4abf8bdda073e84c7af8dc3fd791073aa9b4cbc45a12bc8d0c00"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "b8a787975a7b9eb0af2e36f6daeae4127ca9711b8018114ca1a4cb53fa666fca"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseFirestore.xcframework.zip",
      checksum: "444d381d2cd954da88fcd13ba6e3a8c3ea5049e0d7bac1e542ceff95f45074bf"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "78f3370b861f68239cdf72667942dd53bc33638daeadb65ffe609f1b14eb02e1"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseFunctions.xcframework.zip",
      checksum: "01cffc0c9a195e06083c86d15f3527bfb20afabd43b935809bf61e50dd7f6ebc"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "b17750d33f913eb256a2504006274e138cf1239e5b8b7cad058a7ed9566d2d87"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "a9b6990aafa4487b798bc6e1f528242c491a8b69ae7a774b935c64348a760a95"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseInstallations.xcframework.zip",
      checksum: "93e3e4fc329e5b62513a54936ae786577a3a87efa41ad560e48216b054805ae3"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "4dcc8c8648d0daf7877014bd48ce848bc0dd201fa00e36bada7fc6ac59c304ad"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseMessaging.xcframework.zip",
      checksum: "53facb9974b9ec925cc2608f932c79ed620a2d91f857e2294d49b1a0364fd2af"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "04602214901756927e4a39b671af2d68caa0b123cbd9309330eb0442b3e029c6"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebasePerformance.xcframework.zip",
      checksum: "4c2c6078997238867dc4f3d8162ee5f99de5e8dba7def3035d8618c14cc12ef3"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "3627a4f4b927baeca9ea02f7e8a9d50f5f016535b62a6c0550491e771e885f5d"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "c354a49e7c84c4e338effeadd3295f96f9b84d5bf843e60832fc2eac0273c519"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "1b85ca31bab4281f780a5b2c431809c0c682ab786cd678efd565cf2889c24909"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseStorage.xcframework.zip",
      checksum: "5338fb4eeeae0c75e1aa1050a5fb66af05aa834ab8cbf18412878613b3f09074"
    ),
    .binaryTarget(
      name: "FirebaseStorageInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseStorageInternal.xcframework.zip",
      checksum: "d89767989c4b5f6ce4d596301689102ef2d22a3e1de2dceaa8c827825fce6266"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GTMAppAuth.xcframework.zip",
      checksum: "db4b4159c1aa9fc849e1ecf7d30a48ae4010cb767046e68d1acdecccbd31b5c7"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GTMSessionFetcher.xcframework.zip",
      checksum: "8516514e02188162f3f8b03d9c4335de163db3eb2efd45ae3c7a2087f8406fac"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "afb44892df32130fec6d78953318089bb0938d9aacfea88227d55247a93e8f8e"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "8510b87f5633c9b82194e6aed80e9f20e67fe3428e026ea674f3c6a53477e9a1"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "9a5f9083eb9b2ef3344afc47f90793afd02b9e8d0d93da79d5ef2b3d72ecde67"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleDataTransport.xcframework.zip",
      checksum: "de0cef63f99843728cfac0b7fcbbe2d23dcf77d28fe8fefead6b0134d0231c84"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleMobileAds.xcframework.zip",
      checksum: "767f7757e25310a90c26d999340417a75c1d6b72da43b31cea469e9c0e050077"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleSignIn.xcframework.zip",
      checksum: "fed13acb203acdb56347b21959920a013349629c436c41e36e91f8062b18fbf0"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleUtilities.xcframework.zip",
      checksum: "4a3a91a6e3f21d3998eba5f1e36c6846fc57a9521db792dfa99aec50a49a8be7"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/Libuv-gRPC.xcframework.zip",
      checksum: "11a2384df8bd50498ddf98c8cbbe87f3b43d675eb5cbba9501f289ea53c5b454"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/PromisesObjC.xcframework.zip",
      checksum: "2c9fcc56baeebc14c0a3efb4cbfc89a9b48a5ee5752951b0616c7e0669bfc996"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/SwiftProtobuf.xcframework.zip",
      checksum: "d7454883f141baf05eb37e03bb5bb1cea99703fb805a631d681e712ded409dc9"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/UserMessagingPlatform.xcframework.zip",
      checksum: "6653c6c07add785f987f54ffe9d2bff8e3e183a71a53c26390e6b242ba245f31"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/abseil.xcframework.zip",
      checksum: "9bee1ee875e2582043050646cb93e7cadef5c5e9f1efd4b23959f7a2d28cbd9c"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/gRPC-C++.xcframework.zip",
      checksum: "6b30518053d0d6b819c56265b194cc0158e5e9ffb5b11f8bb0387ac8c28e9213"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/gRPC-Core.xcframework.zip",
      checksum: "5451b991f8c4f011498f466a722598817921e622d58ac0d0a893332a1697244a"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/leveldb-library.xcframework.zip",
      checksum: "dcb3e355e835a9669acd9a98d191bfcfe6139fdb5c60f720275660c4879cf6ba"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/nanopb.xcframework.zip",
      checksum: "34f04a28fca60e2b2b5e967ee39b66e6ffd7d456a6c21469f3127cbec8217cc0"
    )
  ]
)
    