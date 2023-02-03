//
//  LiquidTests.swift
//  LiquidTests
//
//  Created by Tibor Bodecs on 2023. 01. 17..
//

import XCTest
import Vapor
import Liquid

final class LiquidTests: XCTestCase {

    func testExample() async throws {
        let app = Application(.testing)
        
        app.objectStorages.use(
            .init {
                MockObjectStorageConfiguration()
            },
            as: .init(string: "mock")
        )

        try await app.objectStorage.upload(
            key: "",
            buffer: .init(),
            checksum: nil
        )
    }
}
