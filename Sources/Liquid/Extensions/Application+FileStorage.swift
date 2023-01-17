//
//  Application+FS.swift
//  Liquid
//
//  Created by Tibor Bodecs on 2021. 03. 06..
//

import Vapor
import LiquidKit

public extension Application {

    /// returns the available file storages
    var fileStorages: FileStorageDriverFactoryStorage {
        liquid.storage
    }

    /// returns the default file storage
    var fileStorage: FileStorageDriver {
        fileStorage(nil)
    }
    
    /// returns the file storage for a given identifier
    func fileStorage(_ id: FileStorageDriverID?) -> FileStorageDriver {
        fileStorages.makeDriver(
            id,
            logger: logger,
            on: eventLoopGroup.next()
        )!
    }
}
