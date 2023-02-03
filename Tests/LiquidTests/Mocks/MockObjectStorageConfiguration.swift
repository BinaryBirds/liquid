//
//  MockObjectStorageConfiguration.swift
//  LiquidTests
//
//  Created by Tibor Bodecs on 2023. 01. 17..
//

import LiquidKit

struct MockObjectStorageConfiguration: ObjectStorageConfiguration {

    func make(
        using: ObjectStorages
    ) -> ObjectStorageDriver {
        MockObjectStorageDriver()
    }
}
