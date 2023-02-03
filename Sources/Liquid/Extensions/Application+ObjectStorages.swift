//
//  Application+ObjectStorages.swift
//  Liquid
//
//  Created by Tibor Bodecs on 2023. 02. 03..
//

import Vapor
import LiquidKit

public extension Application {

    /// returns the available objects storages
    var objectStorages: ObjectStorages {
        liquid.storages
    }
}

