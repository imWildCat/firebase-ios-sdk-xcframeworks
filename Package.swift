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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/AppAuth.xcframework.zip",
      checksum: "98a428a16731eadc3775c251cb794dba81a829e05e06d7a495014b4f633a6399"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "89b8e2fea794b99bd27ea828d4b388440f78d73f239800063703d761efbca44b"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseABTesting.xcframework.zip",
      checksum: "9c5cdb39abca8fa3acc40775e9dea8143992ad9f34bd39097de9e299f380ce84"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseAnalytics.xcframework.zip",
      checksum: "ef0b8fd1a5f9d841f0faf466d870641145a40641c6f1a199e87fa6615a1ccb04"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseAppCheck.xcframework.zip",
      checksum: "257a29452a84ba50ed4aad7e1768b055d616274220c2268a6df375a0955622e7"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "245b51643d51fc888a79b332ca9d9eea946c8309eda768d3b647c9af7447675b"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseAuth.xcframework.zip",
      checksum: "27672730afb8f02cab840d91361f665540a0934e428c177f66da80e253fa8c56"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseCore.xcframework.zip",
      checksum: "48d76751c57ee95a923591cab0c74bae5b12e2e1aad0cde66c3b3537d4dcb1be"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "b9c4753d79e1e15d2ff0e1d357b5a0852a172becaab47fb305fe9765f39dc61c"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "f094f4243ee5382a9f89350d5fd21abad374ba5519e5c7785b44d748a66cbc2b"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseDatabase.xcframework.zip",
      checksum: "471a53dcd7001261dd4c9420b52a6a7f04409c4a42780ed8a24d287a2311c150"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "ca8040bd85cd0459412bd53a00e0d6856ed9049a2a5f0a9dfc52610df472f17c"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseFirestore.xcframework.zip",
      checksum: "358706dbd17a6389663a43794acbdf13d6f5e979380d87e2c883c810f9631f9d"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseFunctions.xcframework.zip",
      checksum: "9fb2b1ecd5f91a8aede38f5142ebc40ea580235e9b2087187ae288dad725c29f"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "a9e0f1ba8387b3de4f6dd014124f5e859014c28f1c98e90336fedb151f03c0be"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseInstallations.xcframework.zip",
      checksum: "73e9d9ceeece9a36b8316e53355a496543352ec62b5e933158eccd14e57d3146"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "1de88aa62be8ab672d2e93e44f60b62e7a1a9a200710fbdd86ac465cfc0bd53c"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseMessaging.xcframework.zip",
      checksum: "9eda4dacb1284a0b6c223714793925a108286c23320c4fcc688fd5771cd3fd6e"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebasePerformance.xcframework.zip",
      checksum: "08d6afc955c178099dfa7db4faf50327113ad77f551b632ecd09fe349bc9a33b"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "3cf2e7a5b8f7c28cb98798c67d97f6740db98e0ae1327aefa6815c81bbfbe2c4"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/FirebaseStorage.xcframework.zip",
      checksum: "f4104d559737c13775d037ff9c86db37a0293ca1e46620ca3ee3087bab0ca43b"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/GTMAppAuth.xcframework.zip",
      checksum: "72a822a38d0d8b5b4b98cca33dabe256e98a1729b0d60145079e09f47c1378d6"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/GTMSessionFetcher.xcframework.zip",
      checksum: "505b5a62bda862b5135ef3ae03b8e42bf5b38250cb78a05aa3505fa56dddc0ae"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "d66ed76f96133e283f609cc995eb579e33bf9fa36e56512428ebb3cf3b788ee4"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "d9ed605839b985c22df0fa82328fab9f16ca24e1bf9f45b87229b27824e57828"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/GoogleDataTransport.xcframework.zip",
      checksum: "eaca9e68677078c45f87e786e6f04d0cd282cb23a3940c7bb7348c49901dd4d1"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/GoogleMobileAds.xcframework.zip",
      checksum: "520a6929e7b13e8d99ceb8454b8d0f729e37434b85d1bad2275ec8bd481d2c60"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/GoogleSignIn.xcframework.zip",
      checksum: "88e4437779e624f2f999cc8adaa5f17499058ead83c95580beee8e4570b10387"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/GoogleUtilities.xcframework.zip",
      checksum: "1cfea06397c70bb7bca5f5fb5952c479a8f7189ef3d906e9537955ac6eec9871"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/PromisesObjC.xcframework.zip",
      checksum: "1b2870f226a07cb7d80e71574427e8ae713b22acb1377c3801feb95fb23d9fde"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/SwiftProtobuf.xcframework.zip",
      checksum: "1e1f50c535405ede814872c5a376de65ac41e3b8b10c4d1c0a627678c758a936"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/UserMessagingPlatform.xcframework.zip",
      checksum: "72009bf868a8646f7503d20837b12cd86be90b53ab42c8b3a0ebdfe00ea2c2a5"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/abseil.xcframework.zip",
      checksum: "aad3597054c5a96068dcd447e72ccec20c05475ccaab09d12d0d74e369982696"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/gRPC-C++.xcframework.zip",
      checksum: "8c0eb39a9165d717e14fe360dfab821c363ad8a1f14fee4eeac0e81823ff123b"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/gRPC-Core.xcframework.zip",
      checksum: "b8a91ce3d4510086f9497044676efcfce97d64409408bb4f647c86bc053e52c2"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/leveldb-library.xcframework.zip",
      checksum: "750d5b1e0094734003635aee6e7b10d0f380a295c149df4a1b0159c13fee8d0f"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/8.14.0/nanopb.xcframework.zip",
      checksum: "d5214b6f40bd63103b11c66780a64d6f2e01e7f9b221753660bba96592a05228"
    )
  ]
)
    