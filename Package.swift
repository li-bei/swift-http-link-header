// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "swift-http-link-header",
    products: [.library(name: "HTTPLinkHeader", targets: ["HTTPLinkHeader"])],
    targets: [.target(name: "HTTPLinkHeader")]
)
