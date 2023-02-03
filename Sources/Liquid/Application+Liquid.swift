//
//  Application+Liquid.swift
//  Liquid
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import Vapor
import LiquidKit

extension Application {

    struct Liquid {

        struct Key: StorageKey {
            typealias Value = ObjectStorages
        }
        
        struct Lifecycle: LifecycleHandler {

            func shutdown(_ application: Application) {
                application.storage.shutdown()
            }
        }

        var storages: ObjectStorages {
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
