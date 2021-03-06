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
            if application.storage[Key.self] == nil {
                initialize()
            }
            return application.storage[Key.self]!
        }

        func initialize() {
            application.storage[Key.self] = .init(fileio: application.fileio)
            application.lifecycle.use(Lifecycle())
        }
    }

    /// returns the liquid file storage driver object
    public var liquid: Liquid { .init(application: self) }
}


