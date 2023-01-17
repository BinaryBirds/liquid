//
//  Application+Liquid.swift
//  Liquid
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import Vapor
import LiquidKit

extension Application {

    public struct Liquid {

        struct Key: StorageKey {
            typealias Value = FileStorageDriverFactoryStorage
        }
        
        struct Lifecycle: LifecycleHandler {

            func shutdown(_ application: Application) {
                application.storage.shutdown()
            }
        }

        var storage: FileStorageDriverFactoryStorage {
            if application.storage[Key.self] == nil {
                application.storage[Key.self] = .init(
                    eventLoopGroup: application.eventLoopGroup,
                    byteBufferAllocator: application.allocator,
                    fileio: application.fileio
                )
                application.lifecycle.use(Lifecycle())
            }
            return application.storage[Key.self]!
        }

        let application: Application
    }

    /// returns the liquid file storage driver object
    var liquid: Liquid { .init(application: self) }
}


