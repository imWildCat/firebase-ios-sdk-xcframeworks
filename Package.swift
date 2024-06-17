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
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
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
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuth",
        "_GTMSessionFetcher",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseCrashlytics",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_Promises"
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
        "_FirebaseAppCheckInterop",
        "_FirebaseDatabase",
        "_FirebaseSharedSwift",
        "_leveldb"
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
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_absl",
        "_grpc",
        "_grpcpp",
        "_leveldb",
        "_openssl_grpc"
      ],
      path: "Sources/FirebaseFirestore"
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
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging"
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
        "_FirebaseCoreExtension",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport",
        "_Promises"
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
        "_FirebaseRemoteConfigInterop",
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
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_AppAuth.xcframework.zip",
      checksum: "31d8a0e7946a36e5876d0d504062a74c5bf25e0996f80b8aad3042122350f73e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_AppCheckCore.xcframework.zip",
      checksum: "fa859449756c7a3b921620ee04df9bd12e2409fd7577781d295e976ffdc8bc8d"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FBLPromises.xcframework.zip",
      checksum: "752179737ed32dd23caa37524359ed16910ef088e604ad19c3deb021b9e96f13"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseABTesting.xcframework.zip",
      checksum: "70358546468642e6ccf09d39c21302e71ef9b8101d96baa7ab85d967f34816ae"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "2666ba8da0b71d22dc75696ee6b41fcb6b1f6e0c7950cfbc73039ea5aa48bce3"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "3bbceea3ee2a2b4cb3ea07ac4610e2076aef69a35431ebdcea6ef3f1876d1e2d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "64afe060c0846c65d6e61b6fe10c406796a7b292c6f60adc5d557d509e98a577"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ee44767379b3957761acca7e118e90a26767f831832b4d4a40d07dbd578b206a"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "a69232e97599b8099206e3795f3a1f8fcf545f1da3dce06650309e6ea6e88a32"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAuth.xcframework.zip",
      checksum: "43eec49ef500536b1a3f4c81effc2b3cdc441f10c7b264488e8b4342425651c8"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "cb871d38142dad4bc41929f4332e595b748dca5f13ab5c12fc4bba6db3f600f1"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCore.xcframework.zip",
      checksum: "fd0901ae9c0e90d047d3e1a4cd461165d4d6d7a89650c8e89e2af8eed149ebcf"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "8811fbd6fd0588be60f357576f7dcc531333e592ce998243e972f2203a594c28"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "1cbd16dc6552065258d5314c8e9c2b1ca5c507927e9ddb8b5549ba6978c61264"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "81d07ba7caf7ca4b2ea0c5d9050801d5717b62e60156502a8a51765788957b6e"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseDatabase.xcframework.zip",
      checksum: "8fca4696eeaa87d800b2a700c10198e4e3c0b52afece3cc5259721a801b13db2"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "962f5e95f75ba57a3359173a567ce604c72c1a9faaf1cf47bf72681ba1f9431d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseFirestore.xcframework.zip",
      checksum: "69c1c65eeb09fa6bd8d0d843f6a74fce5a6e1d36c13d8937404bc1ee1a1c68c9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "7e764afa9439bf1d30a6659067df18d43fcd6dceead6dc82cec0f4f05d458621"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseFunctions.xcframework.zip",
      checksum: "9a949f60bf1e1e9dc9eca93be190d0e086ba9b015eceb8c9d2d90d28f793a9d6"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "fa07dfa115fe6b5d4585e9d86396bbbe10ec4fc93938a2add43df56e47962541"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseInstallations.xcframework.zip",
      checksum: "d487707ab66b8e1fcf4c44a704d718aba688a97bb638c5886e832bc10eac61c1"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "dfaea05f92694543aa8663b7f450cbbf9a5adad35e85efb970f4d2207e80216f"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseMessaging.xcframework.zip",
      checksum: "023cbe003629533f21e54f4220af01069a102b62933b342ee46720a29b7d3acf"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "fb9db4adede23b72047b518ec8c34c7fa573d7691065941a003cf1f7c2fcaffc"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebasePerformance.xcframework.zip",
      checksum: "27553ed9a296a9f383560482bd6c55536b193c16a9a5163aec5a1a45fdc9cf3b"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "c0bfe7b91c88501e6a3144c257925bb2b785645c781289000e4445696e70b557"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "60b372c3c01503b51c7fc3abe76541f78b0468a0a03fb95118fa5280e874b689"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseSessions.xcframework.zip",
      checksum: "9a0f780cfae89cdd85afb32b325be9b47761dd1715a26ddeae703376e382d581"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "4419b5705b3583c97ba68f494dad0a96b866ae47c1f326175e87e1a85b8aaf77"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseStorage.xcframework.zip",
      checksum: "d8870c7d78beb77bdc4dfed15f826f2ac165c9a0a57f4e82198a9f45e291e9b2"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GTMAppAuth.xcframework.zip",
      checksum: "08b45a3701e665e17fb112e92ac9a2c97da7a44668577ac0ba2f6d8efd6f9a40"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "f0e3763e5d05b4a8fcb105c2e20122d0b110b8a47df8e6d4f556c48973952fbd"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "cfb0d9c53c98949bf6047e7c4251c701eba489dacc9bbf3f59d86a70af2594a9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "2c2aaf49c80eb927b49b79c033f599476fbdc0d8dd814b956c02dbfff90da8be"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "191955a9f542acdc0b1b3dde8f211653a4ebe80dbe9e17fffca5febdfbd76f26"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleDataTransport.xcframework.zip",
      checksum: "4debc1ba01d91e6bd5dc8dd9422cd32660f24f318fa231261ba4c4a4dd347999"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleMobileAds.xcframework.zip",
      checksum: "325fcbaeb3a484dc18a0cbb35e4cdc8a51dd1c7793ff6bd5e40d16f3aebca005"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleSignIn.xcframework.zip",
      checksum: "9e4c755eed83f5876a25230f4d1512a179990cd1f5ebe9ac0c97a2ff01dacb6e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleUtilities.xcframework.zip",
      checksum: "c0906ec4f0dc93740cc94595ef0c98cc08536d6cfb1597130b33e68648fb1906"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_Promises.xcframework.zip",
      checksum: "3c39d25a73e4678f237f3780e3fc09861f03d264eec306bd899f520340c245bc"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_RecaptchaInterop.xcframework.zip",
      checksum: "63f89d47e7fade63945a5dcb47696691008f0e10790516cc2343232ecf92c5b6"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_SwiftProtobuf.xcframework.zip",
      checksum: "f4fb22cda2a79d304cb1a91c32ba1cb3ebc5f970b45026df504a2e12111ace07"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "204c4c15f0150848fac880734784321ca72ba3a934932213a2dd1df82c4f2bdc"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_absl.xcframework.zip",
      checksum: "932fb7014f338fffa42687c0536e8bfde33d4da04c10f03ca908f7eff8e6e2be"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_grpc.xcframework.zip",
      checksum: "c3fe1695c8535b426db766bde904025f54f53999e987cad88bb1efe4845d3a7a"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_grpcpp.xcframework.zip",
      checksum: "408c34ba6f5be1b46c92ffdf74d26a098632f0d59b4930d6cd3bcaa0f4a17fac"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_leveldb.xcframework.zip",
      checksum: "60713fa52168d88b086da73ecefcd0e957d47bc014df19c456f1c11f2c2f6ab6"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_nanopb.xcframework.zip",
      checksum: "50426c34bcdf15ce891fa9df68370e92c93da7f28afc4d0e769553e2bdb92d74"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_openssl_grpc.xcframework.zip",
      checksum: "171b36e8a84ab270d2476a8eda6c80c0dc93ae36cb03f4e22df6ce77c9b8330d"
    )
  ]
)
    