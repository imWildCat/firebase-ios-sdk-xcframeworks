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
        "FBLPromises",
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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/AppAuth.xcframework.zip",
      checksum: "22b3be685c7e860dfbdfbea8428e37078d9f539e34c6dda7215939b64b3ef2e9"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "a7d1878e37838c19ec9e63fcec2266f6d90462faac092f079c315dd965483411"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FBLPromises.xcframework.zip",
      checksum: "147ee37f6a89a8936ea37a67b9e0938f60cee8d1fb23c924a0368feae280b55d"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseABTesting.xcframework.zip",
      checksum: "d03eefd0e79ab692985451f6c0c9ef3cf5b9915fbc71ee23f7a0d92f58dc5fee"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAnalytics.xcframework.zip",
      checksum: "ff38ec0f2a7373e37e48389a529b82e8bdb73e0ca0e57276f1dcd476802a37d9"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "8da6768cfda05ef31b80b673d0ad965609350bdd3ab9d91622aaaf90b3237304"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "87b2b73a90cc5fc577bc69ee75b7610a1ceb48abf11ae4fa50dcc6b1d259559e"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAppCheck.xcframework.zip",
      checksum: "de589ad5734dc6c58e6786f323c1820818797c37bc395edc81ad853fa563a3ed"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "895f78bb7149dc3914ad36b5a2525abf6569eefd7e6da6460a21deef5eb2adaf"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "f71ac4e7855ded06b5a5006f6072fb41628d3805682b953bf355ba9618eed36e"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAuth.xcframework.zip",
      checksum: "56a86e3725112a830e6d8ba438e57aa579e44945bd6dfd866e922922510049d7"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "e7f2f717de837a5e0e14fb7113a7f3fd437ca57fc42fde00a05c0cb8f21d7aac"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseCore.xcframework.zip",
      checksum: "d36baf9a58139e68971e3339e2bb027e42081581afa51331583a7f450faf3e2d"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "927cbb8aed84ace1f71bc3eaa79fa0c44e83e2337f37c964f7d2aff97a106bde"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "b8256e424fd31ac3cae7160a2a838f8ca24487c5455309f3bf80beb96691a571"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "11e5f6608472833d38d16bc01735c5e55273e21e533ecf897e8c5d753e244fd7"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "9959fa6f53019f207ce4b2cd62d95dfb1942f72d305030650c226ab396964ab0"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseDatabase.xcframework.zip",
      checksum: "e06036093351ce65f38bf47dc146e947431fb62f82a29296caf4cdee4c14b7ff"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "2ce54fd1e9e7a7d9bfd8ce37f5941fe314abe1c3050a142a40d383929366b239"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "84c1563626c8782d209cc30b2f0157afa99883e4b2ddf64906bbccfbf3f5a221"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseFirestore.xcframework.zip",
      checksum: "d477c5262edb91f305846ca5e0e79b15e2d52344ad01305de0cf41b247af1661"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "c71a3a177c793bffa1cde9a95f1f606ee7e1ce1cf2d2383d7bdde2f2ee6efc51"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseFunctions.xcframework.zip",
      checksum: "adadd0833a1b267da095fd861f43e03267ee2efa0fb3f862a79cedf7ab364af1"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "82ca3015e0fd81a352f932e9bf922ec9fe7c5290c5eec3f3251d0f2f51aa1041"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "02f4bf1b304cba2456087971618377d0772b03ba4a8a71d47e5068152dee3efe"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseInstallations.xcframework.zip",
      checksum: "1af4c38ae5b5a8bb7ba25338d526f718f2abac66eb551342f61cb8352cf99f5b"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "3a44c14cc25fd22dae626e650b1165c176adaca501597a3a475e1f07f6b4b7f3"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseMessaging.xcframework.zip",
      checksum: "7aa2e4d245fbe1fdea39e411cfbc8cec6a99445824adfa8f56e6cc8669cb9fec"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "d9579aeb3de3532c765763c11e000889ad48903f2e1e47239c30c45d2be5ef7d"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebasePerformance.xcframework.zip",
      checksum: "c4f385ddc5bd7ba6dc93a5fa2ea922324f2fbb05be7e97488444d8180530df51"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "f70ef887a1caa02bcbd73bc7b924de2b87cfd467eca3553e94d3741333d97f45"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "c884ca8665ff0094fe2b848bdb43a26e9ae8a63ad49129748ef87442d7a1b533"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "ed603f8215f02297d81169b55031d3faa25b97d897e6f4a64843e63e3c3f18f7"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseStorage.xcframework.zip",
      checksum: "03dfdadaa80c948d26a92de960810c105fa02f699a116869c941b7a7aaf7394b"
    ),
    .binaryTarget(
      name: "FirebaseStorageInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseStorageInternal.xcframework.zip",
      checksum: "67fb3cf1bad0e29f319f27a42f20552a6099d1e936b3963cbd35070077aba8e5"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GTMAppAuth.xcframework.zip",
      checksum: "f3b1a49fa3652078d5dbacec44a5a1ba7d87d9d9d961768c39048d779a8569d6"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GTMSessionFetcher.xcframework.zip",
      checksum: "03b9d758bdb778449c22ea1ad37c951c7e2c34c5608c4613db34e4be514770a5"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "131546aa341d754918ea77c2bed115dc4573310ff15b328da18a4cf09d7c246e"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "35cdb7ab10b78afbc40944cf50ecf82374f187842030d6558167bfce6c85087c"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "a6a577eb114b94528ce333cbd4fad89ab605a36638b026966a1f0ca03061de05"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleDataTransport.xcframework.zip",
      checksum: "c024f8ac82b75d737b0c16437ebeb8a2794fca92388678d00878f5e7be0fe705"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleMobileAds.xcframework.zip",
      checksum: "8b692fccff3613c1c2ca234dd9889a49049e5eeca3888878d1178a1dce84f76d"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleSignIn.xcframework.zip",
      checksum: "f6380da2b6e183494f5d97ccd1aa8cf8549083e3ee5947f60cbfd64459dbfa83"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleUtilities.xcframework.zip",
      checksum: "83b01e4bfd2525a326a53a18fb9b93290ca3a26ba2728bc668efa29af2dac395"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/Libuv-gRPC.xcframework.zip",
      checksum: "75373871fe70b7fb9406222a08a39d445bfff70aefb855267fa73ec7be8341d9"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/SwiftProtobuf.xcframework.zip",
      checksum: "626f6062b632baa388bbf3161f5ad1c568d6120eb8ff5d65ca744419fc7978b7"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/UserMessagingPlatform.xcframework.zip",
      checksum: "2b9d29453fd506b96d8ceede784c55f2e97fb64ee237caa6ad5ed8a3b9187c7c"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/abseil.xcframework.zip",
      checksum: "76172e7b505a6ae8c0a80751666dcccb76ff91b957bb29264e45f7a609be4785"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/gRPC-C++.xcframework.zip",
      checksum: "856ad57cd1fe23e443ef45ac27375e5019920f4cac43607f347b6e2bb311ba12"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/gRPC-Core.xcframework.zip",
      checksum: "62e04e0234f4df3fcbcd45d2688d2a4ac216731d15dd2de195168d7f7e714d73"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/leveldb-library.xcframework.zip",
      checksum: "7c4324e77c5ee3fece493cbd0ad5584ee825a53ee404c1b91aec80a3422e8a04"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/nanopb.xcframework.zip",
      checksum: "245e44dde16e46ad0e0a7371387b731d25d0335e8fd4dbdf10ac83710c8af26e"
    )
  ]
)
    