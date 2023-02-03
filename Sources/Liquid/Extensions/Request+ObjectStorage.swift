//
//  Request+ObjectStorage.swift
//  Liquid
//
//  Created by Tibor Bodecs on 2021. 03. 06..
//

import Vapor
import LiquidKit

public extension Request {

    /// returns the default file storage
    var objectStorage: ObjectStorage {
        objectStorage(nil)
    }
    
    /// returns the file storage for a given identifier
    func objectStorage(_ id: ObjectStorageID?) -> ObjectStorage {
        application.objectStorages.make(
            id,
            logger: logger,
            on: eventLoop
        )!
    }
}
