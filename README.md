# Liquid

Abstract file storage component made for Vapor 4 using the [LiquidKit](https://github.com/BinaryBirds/liquid-kit) file storage solution.

## Supported drivers

- [local](https://github.com/BinaryBirds/liquid-local-driver)
- [AWS S3](https://github.com/BinaryBirds/liquid-aws-s3-driver)

⚠️ In order to use the AWS S3 driver you have to configure your [credentials](https://github.com/BinaryBirds/liquid-aws-s3-driver#credentials).

## Usage example

Add Liquid as a dependency using SPM (with the driver that you'd like to use):

```swift
// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "myProject",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.41.0"),
        .package(url: "https://github.com/binarybirds/liquid.git", from: "1.2.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver.git", from: "1.2.0"),
        .package(url: "https://github.com/binarybirds/liquid-aws-s3-driver.git", from: "1.1.0"),
    ],
    targets: [
        .target(name: "App", dependencies: [
            .product(name: "Vapor", package: "vapor"),
            .product(name: "Liquid", package: "liquid"),
            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
            .product(name: "LiquidAwsS3Driver", package: "liquid-aws-s3-driver"),
        ]),
    ]
)
```

Driver configuration

```swift
import Liquid
import LiquidLocalDriver
import LiquidAwsS3Driver

public func configure(_ app: Application) throws {

    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // using the local driver
    app.fileStorages.use(.local(publicUrl: "http://localhost:8080/",
                                publicPath: app.directory.publicDirectory,
                                workDirectory: "assets"), as: .local)

    // using the AWS S3 driver (credentials must be configured as well)
    app.fileStorages.use(.awsS3(region: .uswest1, bucket: "testbucket"), as: .awsS3)

}
```

Basic usage example:

```swift

func testUpload(req: Request) -> EventLoopFuture<String> {
    let data: Data = //...
    let key = "path/to/my/file.txt"
    // the upload method returns the full url of the uploaded file
    return req.fs.upload(key: key, data: data)
    
    /// resolve public url based on a key
    // req.fs.resolve(key: myImageKey)

    /// delete file based on a key
    // req.fs.delete(key: myImageKey)
}
```
