# Liquid

Abstract file storage component made for Vapor 4.


## Usage example

Add Liquid as a dependency using SPM, you can choose between the local and the AWS S3 driver.

```swift
// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "myProject",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.5.0"),
        .package(url: "https://github.com/binarybirds/liquid.git", from: "1.0.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver.git", from: "1.0.0"),
        .package(url: "https://github.com/binarybirds/liquid-aws-s3-driver.git", from: "1.0.0"),
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

    // using the AWS S3 driver
    app.fileStorages.use(.awsS3(key: Environment.awsKey,
                                secret: Environment.awsSecret,
                                bucket: "vaportestbucket",
                                region: .uswest1), as: .awsS3)

}
```

File upload example:

```swift

func testUpload(req: Request) -> EventLoopFuture<String> {
    let data: Data! = //...
    let key = "path/to/my/file.txt"
    return req.fs.upload(key: key, data: data)
    // returns the full public url of the uploaded image
}

// resolve public url based on a key
// func resolve(key: String) -> String
req.fs.resolve(key: myImageKey)

// delete file based on a key
// func delete(key: String) -> EventLoopFuture<Void>
req.fs.delete(key: myImageKey)
```


## License

[WTFPL](LICENSE) - Do what the fuck you want to.
