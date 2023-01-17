//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 17..
//

import Foundation
import LiquidKit

struct MockFileStorageDriverConfiguration: FileStorageDriverConfiguration {

    func makeDriverFactory(
        using: FileStorageDriverFactoryStorage
    ) -> FileStorageDriverFactory {
        MockFileStorageDriverFactory()
    }
}
