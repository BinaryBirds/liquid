//
//  MockObjectStorageDriver.swift
//  LiquidTests
//
//  Created by Tibor Bodecs on 2023. 01. 17..
//

import LiquidKit

struct MockObjectStorageDriver: ObjectStorageDriver {
    
    func make(using context: ObjectStorageContext) -> ObjectStorage {
        MockObjectStorage(context: context)
    }
    
    func shutdown() {
     
    }
}
