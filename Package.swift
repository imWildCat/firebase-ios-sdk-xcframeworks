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
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/AppAuth.xcframework.zip",
      checksum: "b16d1801515a91400ecdddfb552c8fc1ff2664a722a77de9fa463772d7b7f7dc"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "b51a232e0e3f7dfd8c95b27c41d0ef014811f6d7966e66ebab0a542af1f835d3"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseABTesting.xcframework.zip",
      checksum: "e85e07234f92c67b51c17bcdd6ac0efd67b0b9b74d2975cb7b1e8ec26f60f808"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAnalytics.xcframework.zip",
      checksum: "162fb4a8a503ef357e01808583ab049d0ace8965aed735d582843f311342dbe5"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "8251800859f0bac1e27f39f2606ea3aaeccc89bad4ab1c4344d3956d2c5b1ac9"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "e6e83e8d172ecf8b2cdc1def1dba265f93c1f8f0942b583ac9512839be984492"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAppCheck.xcframework.zip",
      checksum: "3fb9f343c1407f0f65d23e42e9252210372322e2afe2007ad41a02a259acdac7"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "1972f57978c28fbe9733a461df754fbf862b20ce5e59287cf54ef2e8023a7891"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "47a9d69b136551f7e7cb5df36780d7dd160d04623bbc940abecc8f03e8d27d9f"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAuth.xcframework.zip",
      checksum: "9861ebc1ce97a0b159cd733a989a10d96d58e38dfd053b6a9dd31be4c276d55c"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "5cccc0b519f8e0995d2e41236f0dfdb82cc5740fcda0f06aa95f806d95e6bc58"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseCore.xcframework.zip",
      checksum: "b4f55781dbb23052f42c418a03397ca8e9f72c5ea71a21d53bb80fc06c4cf4df"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "447c531e3e00eccf06916c2b6a0e0e5aab1d9ead5f140eb8eb467badd638394a"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "e7a7d9973454c7cbdee42e0dc7ec0022dd40e651c40957a99e78824de6cf7c5a"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "7220c385f315068a1e221875ca53f7c0bf66c627947f13cff26482dceb3e4306"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "940380bc60c4617f960d10299b290b03ee5e7fafdc81f4b3c2766db8718dd5db"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseDatabase.xcframework.zip",
      checksum: "a2b2cb5794efd4ea3f27587c47aff4ebf758e88b939e2274d342ab6a0a574f11"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "a7d72eb67457b06343938e39cb50d3c5c58e6a88473344d6b999660c98c28084"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "6669cc48a0a2c2b3c2994e2e429f84d53e6d58acc106f5bbe974e77c5ca7e54d"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseFirestore.xcframework.zip",
      checksum: "6536570db00453ec166f6e09836afafd8f5e7bc4a52ed707dfcca000641bb626"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "c30ad2145ec6e02bcc383c7ed48920c26f63320e6ec1ccfe17662cc9e20da778"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseFunctions.xcframework.zip",
      checksum: "f74758b00ec918aeb928973c8309aad6dff400714ded6421d95aa9a35bda1c91"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "9a183df9c2a75c29fc6f0aac88c0d4751dda44542d7dd597b9aa58fe9f645c02"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "6788714aa30b523ed5827b766ead00b31dc19b3922619212dcf26d30db927afc"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseInstallations.xcframework.zip",
      checksum: "bc1d3224aee7b477ccefd4747af3be10155bc7cc9e4cc5f8b40b3cb71d9aeb25"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "a0d3811c208908169ea086d3a16838d7a503f6d631a32782677765c04797c429"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseMessaging.xcframework.zip",
      checksum: "786bd2d3282c33fcb8473cef67d4ad2be3fe06e3bee019c68bd7bef37b4562d7"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "f3d3b55c31421f986934c277f93910550281b179f5adad2e1a2ec2df986b9180"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebasePerformance.xcframework.zip",
      checksum: "87763233b69216c889d7ef174a528d22d07ff9cc12469607e71c64d67570c77f"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "4a98d1cb8e346f5f50d7717de8ec6eac6a68a213a3f155577886400eea71240d"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "8bb6292d634c1fa5065b34f8f5a744d9d9542e1a0ec999c175065c7592c4ef76"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "8d14eadab5a493c2a47453466d29b8419ebce0d9a6ed2ffe1944fc62017c6907"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseStorage.xcframework.zip",
      checksum: "acd2191639bf03920e88a30d374c21831f8bb5d67a1da6c3e31d48a15ffd724b"
    ),
    .binaryTarget(
      name: "FirebaseStorageInternal",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseStorageInternal.xcframework.zip",
      checksum: "ec874ead7a56d522967d0a10277dd3b8497cb13469957254c0db6b1e25e05ebd"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GTMAppAuth.xcframework.zip",
      checksum: "165741103862e05041855431539f73e02a5320add849caaa75011f283f098513"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GTMSessionFetcher.xcframework.zip",
      checksum: "1de5e28b88d9ea34dc9f14af98caa74b6dd8b3a5e398b2310063637aacb9f950"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "77cc3ddebf030d432d1417af2ac397149ab041dad96f2478b0b49c2f2e89fd70"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "44f0753736e509b558c940ca69c0fdd4db01ad489149b3b1e04599e1a6dfcfed"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "3970beff0f7ac971f402af5f98028eedc285ab73d1239e4ede780dcf5006451c"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleDataTransport.xcframework.zip",
      checksum: "9f187b64e18dbbacaa2acdefe7b4631d3541a119a56501492a933143c2aee42e"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleMobileAds.xcframework.zip",
      checksum: "fe9cf25c0265266954c866524ac41bfcbf76009cdd9094c77b30fc40147d3243"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleSignIn.xcframework.zip",
      checksum: "6be638bfd6cebc62535e38127bfd44b90581896c425ef3b9a8fdca4bae46b15c"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleUtilities.xcframework.zip",
      checksum: "60c97d399c0d5ef990e67910d30c50c661184a17188117170e78d2dc126d56d6"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/Libuv-gRPC.xcframework.zip",
      checksum: "2aca077977cddca694409c6b55a469c38b0fd51b732bc5ea987a3860807bb40d"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/PromisesObjC.xcframework.zip",
      checksum: "d6766d43a934de37b92e3dd1c1b70709107d849368da0dd73708049617f9c322"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/SwiftProtobuf.xcframework.zip",
      checksum: "aa833b20733a72b8b70c4d6df0468d2d89862d2ae57fa71b63e95ff0e1610806"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/UserMessagingPlatform.xcframework.zip",
      checksum: "1a48fc8c91649ad9250bd7745549eabdbe1d629d9d18c90cc3cfeec61828fcad"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/abseil.xcframework.zip",
      checksum: "e15703584a4836b2a2d7e3eb8304eb00c3169b259e217eb4e0a5bd0c07d6c310"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/gRPC-C++.xcframework.zip",
      checksum: "29ea450e76d6e244cb90f36db3e6d98c082faaa3713f04e27e491809cec4d7f8"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/gRPC-Core.xcframework.zip",
      checksum: "b45f1bb21035b12789555ee103034f041652a71cf73e34f17bbaf97a8c0aeb33"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/leveldb-library.xcframework.zip",
      checksum: "65c8d71fba01a48b1db9e7902cfd0ab4af6bae99d30be796b83491d9eea18b92"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/imWildCat/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/nanopb.xcframework.zip",
      checksum: "06ca0bc05fe692f7ed07212c1170fb871cffaf035fcfdb5a71147513523b55b9"
    )
  ]
)
    