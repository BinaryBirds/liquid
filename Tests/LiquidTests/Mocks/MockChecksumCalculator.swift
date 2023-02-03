//
//  MockChecksumCalculator.swift
//  LiquidTests
//
//  Created by Tibor Bodecs on 2023. 02. 03..
//

import LiquidKit

struct MockChecksumCalculator: ChecksumCalculator {
    
    func update(_: [UInt8]) {
        
    }
    
    func finalize() -> String {
        ""
    }
}
