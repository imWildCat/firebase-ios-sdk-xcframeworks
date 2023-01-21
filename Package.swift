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
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseAnalyticsSwift",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheck"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS])),
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAuth",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCrashlytics",
        "_GoogleDataTransport"
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
        "_FirebaseDatabase",
        "_FirebaseDatabaseSwift",
        "_FirebaseSharedSwift",
        "_leveldb-library"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_BoringSSL-GRPC",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreSwift",
        "_FirebaseSharedSwift",
        "_Libuv-gRPC",
        "_abseil",
        "_gRPC-C++",
        "_gRPC-Core",
        "_leveldb-library"
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
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFunctions",
        "_FirebaseMessagingInterop",
        "_FirebaseSharedSwift",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseInAppMessagingSwift", condition: .when(platforms: [.iOS]))
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
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigSwift",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseStorage",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "_UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      exclude: [
        "Resources"
      ]
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_AppAuth.xcframework.zip",
      checksum: "ca9fd55e018d69faa8bf977db4f33d05421c58d5445719ec8ba47ce2ffe11a3f"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "2c45ac1829a99d5123664c931ccb9b06163219dc2d5a8f5ed86aaf96c362fe60"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FBLPromises.xcframework.zip",
      checksum: "b617844d24029ab9f9acfc22d20143dc6dcc7f9b44667154a1071cc7d8295d11"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseABTesting.xcframework.zip",
      checksum: "73762eb0fd1cec816bb86ed09daf140e1b6fd00493a917e7c1b8e7210b446129"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "e576bd011312f8eedfd907582c3d1ef7dabfa170274fa1a1a74ff8112c63fd43"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "b63fbf26677ad4130fbbb93f93b3d0d689563bb0d3676ed03fe659c5b764481c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "d84befdc8bafcff1733eae0035b67d9bf50fc7151333b7cd626c80d4ed160181"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "73e78c40839ec03c515f2cf787cc32217739cb28431d919535b748b553042e04"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e7710bf4a4d54b78d995d9d71ad814f2d2e2a5888fdcd97aa1885bd0f0940ae1"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "646bbb279aef42f15bc3e4ea22e431501660ebbaa03acf5a635b21b376075594"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAuth.xcframework.zip",
      checksum: "bacae9a9f6c1880c9b3b669878abb66b802dab9c5b6a0aea6343ce2d7585a34b"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "049edc84320ccfe5f1f984673383c45b78dc7893969f6ea01f2accde8fb00e80"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseCore.xcframework.zip",
      checksum: "9378e32d6cb3689d97eb2b5cb34c032d4a28316e325cf6150365837ea0f2d634"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "89d5ebad411f48d1b49cb3eabb61fa5d03a5b50aeb7a15ccd144c1d177d2ec66"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "6ee11efc0090421f9cf2ddefed631108e3307b346c72345919aad932acb811df"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "9760fc5343661ade471c9379cada4bf93e2f22483131f389d615e08ad4a2b414"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseDatabase.xcframework.zip",
      checksum: "597b0fd87161f3443cd0f3c353efa8dcfec6a6358d754a3e77f440b80e92dbca"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "b1539358b851056ab05bf8f9aaab027e08dec33eef7ade1dc7d4bf9e9987fe02"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "c9f7bce3b1274beeb35fa03116356abae18b799cbacca86dc1191bae43f3a468"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseFirestore.xcframework.zip",
      checksum: "0ff0095e89cd5d56252a30a372a9f121cf01bdd65946b3dc697e0a9380029c0c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "0193bb9f5a3c40c294a07e1f47261739d1c4c896bca95111ce1320f403141863"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseFunctions.xcframework.zip",
      checksum: "8feac5ae81cae7ee3877a139fa7d8c65a833e95648a0a77b481407fe8053e71c"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "41662395db0cd32a99d10425b77f25d52544d5c085713255d79bab04fd157763"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "125132da92c4c9e4cb3e3c598724f32a637ef05c54aa9e7ed90b4f18d400e49a"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseInstallations.xcframework.zip",
      checksum: "7bce50feaa43e318db38b07f0c9c4ebb7d12e83a32a44a16969b3241b324646e"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "8dc1a3bb4cc989ab930e79455605cc3ef8b5254fe9950c9f3e65be228e032db8"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseMessaging.xcframework.zip",
      checksum: "f4057ff9dfb1202dae29e7661a0e83c210543e06fa673d8762f79b62d1c0a453"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "43b04aa8cad92ded05dfa02a6cdbe48016e92bc9ba8d322866dfabe9c61291e8"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebasePerformance.xcframework.zip",
      checksum: "a464916c4debc9688e91eb14c6cf5b39269370b7ea9d4fe806b5ccbfb9463443"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "623ddc913f7354739c3c3ab621ed9cf04c88d9310d6f058384c3fb40a2cd3677"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "1b220ee7e0afb63826bc89c710034f0c4e8a1aee3cca55e2bc98aa8c60bf103b"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "5aa88aef1ee627e18c056aff088bbd3359484c04ed0d8daab1d358fd49cca89c"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseStorage.xcframework.zip",
      checksum: "7fb8b6e0066cdb3d1060803ae6b9c0a00749eef1b09672c16aa188d896661a69"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GTMAppAuth.xcframework.zip",
      checksum: "f538b2c7cfc8ed10e6ddba582ff8a0a26e275318089f0c35192497e5c6f88524"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "244c1afc4ff9af93d5c7058fa00fb37a3d8639ec4a350f080aab3ce61fecb90a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "3947702404d593e19f2d839133c0587a947525abc57daed225c811fa85235790"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f84cd73b89d58a876a91e85217ce32330fa9224c14aa5493e626d98c3e3b7fea"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "81476a72017056dc6311aaf2121fe4108a933829713aecb0e6042e81b79fc329"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleDataTransport.xcframework.zip",
      checksum: "d3e9391a89ad20804a7411f8c6170c7bdac3f9dc9f74895e7beafd428ae2d27d"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleMobileAds.xcframework.zip",
      checksum: "2f2dc0721b54d77468daf7d813d719e4dc31f4c5b09bbb41b78bb558b4818754"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleSignIn.xcframework.zip",
      checksum: "157f8edb5839fc27f838b0a9e5058f501b7c01a24e1e6c98b8b3c104f68cfb6c"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleUtilities.xcframework.zip",
      checksum: "f32ea681ba0194f3f75ad6f1c5a638fe7b873853ec3163ac270a1fbf98fd30e6"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_Libuv-gRPC.xcframework.zip",
      checksum: "3fac8b1462ada96270caef7e211cca2d1e0f3bb9f0c781eadd31e2b7517dc98f"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_SwiftProtobuf.xcframework.zip",
      checksum: "937807a0967075b82a72415747904dd1d34338dcd2020b6bf28e2dea91714409"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "5a1948a9af9c1e77c3b8ff5689e981d71e0b3d3f7a9bd50356ba4de2a764b79d"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_abseil.xcframework.zip",
      checksum: "7e5ae30aff3acd4ed337d85c8b58ebf6a4f6a58baa8546b3aeff0fa92a50aeba"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_gRPC-C++.xcframework.zip",
      checksum: "d7a5001caa7f8b406d3ecf5bac32b0dea80226e71cf3b0d05cfc39387b616eb5"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_gRPC-Core.xcframework.zip",
      checksum: "98027d3a76f95bee46f5f10fd24cfa8545bce21f4753ef60cb3e438a209ec9d6"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_leveldb-library.xcframework.zip",
      checksum: "f8308fae206d395a76ed56102f9aba5dbcaead75cff11a8d48b984807fdef597"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_nanopb.xcframework.zip",
      checksum: "f8340c43320d846b6de7a7188056a7cf75d222ecaceaab48a883c67766ef92f6"
    )
  ]
)
    