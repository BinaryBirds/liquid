//
//  Request+FS.swift
//  Liquid
//
//  Created by Tibor Bodecs on 2021. 03. 06..
//

public extension Request {

    /// returns the default file storage
    var fs: FileStorage { fs(nil) }
    
    /// returns the file storage for a given identifier
    func fs(_ id: FileStorageID?) -> FileStorage {
        application.fileStorages.fileStorage(id, logger: logger, on: eventLoop)!
    }
}
