//
//  Application+Liquid.swift
//  Liquid
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

extension Application {

    public struct Liquid {
        final class Storage {
            let fileStorages: FileStorages

            init(fileio: NonBlockingFileIO) {
                self.fileStorages = FileStorages(fileio: fileio)
            }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        struct Lifecycle: LifecycleHandler {
            func shutdown(_ application: Application) {
                application.fileStorages.shutdown()
            }
        }

        let application: Application

        var storage: Storage {
            if self.application.storage[Key.self] == nil {
                self.initialize()
            }
            return self.application.storage[Key.self]!
        }

        func initialize() {
            self.application.storage[Key.self] = .init(fileio: self.application.fileio)
            self.application.lifecycle.use(Lifecycle())
        }
    }

    public var liquid: Liquid {
        .init(application: self)
    }

}

public extension Request {

    var fs: FileStorage {
        self.fs(nil)
    }

    func fs(_ id: FileStorageID?) -> FileStorage {
        self.application.fileStorages.fileStorage(id, logger: self.logger, on: self.eventLoop)!
    }
}

public extension Application {

    var fs: FileStorage {
        self.fs(nil)
    }

    func fs(_ id: FileStorageID?) -> FileStorage {
        self.fileStorages.fileStorage(id, logger: self.logger, on: self.eventLoopGroup.next())!
    }

    var fileStorages: FileStorages {
        self.liquid.storage.fileStorages
    }
}
