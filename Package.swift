// swift-tools-version:5.3

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "MetaAdapter",
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "MetaAdapterTarget",
      targets: ["MetaAdapterTarget", "FBAudienceNetwork"]
    )
  ],
  targets: [
    .target(
      name: "MetaAdapterTarget",
      dependencies: [
        .target(name: "MetaAdapter"),
      ],
      path: "MetaAdapterTarget",
      linkerSettings: [
        .linkedFramework("AppTrackingTransparency")
      ]
    ),
    .binaryTarget(
      name: "MetaAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/meta/MetaAdapter-6.20.1.0.zip",
      checksum: "3d1a8ca528d87aadf2124d46425848702c3194a71e9b738c452a84806bbae58a"
    ),
    .binaryTarget(
      name: "FBAudienceNetwork",
      url: "https://developers.facebook.com/resources/FBAudienceNetwork-6.21.0.zip",
      checksum: "de44e20e5f3e45753487f2e03beea385253573e024a4f2f24e18adfab35eca53"
    ),
  ]
)
