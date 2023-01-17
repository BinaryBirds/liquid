//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 17..
//

import Foundation
import LiquidKit

struct MockFileStorageDriverFactory: FileStorageDriverFactory {
    
    func makeDriver(using context: FileStorageDriverContext) -> FileStorageDriver {
        MockFileStorageDriver(context: context)
    }
    
    func shutdown() {
     
    }
}

