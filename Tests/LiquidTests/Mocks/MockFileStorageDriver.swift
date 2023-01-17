//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 17..
//

import Foundation
import LiquidKit

struct MockFileStorageDriver: FileStorageDriver {

    var context: FileStorageDriverContext
    
    func resolve(key: String) -> String {
        key
    }
    
    func upload(key: String, data: Data) async throws -> String {
        key
    }
    
    func exists(key: String) async -> Bool {
        true
    }
    
    func getObject(key source: String) async throws -> Data? {
        nil
    }
    
    func copy(key: String, to: String) async throws -> String {
        to
    }
    
    func move(key: String, to: String) async throws -> String {
        to
    }
    
    func createDirectory(key: String) async throws {
        
    }
    
    func list(key: String?) async throws -> [String] {
        []
    }
    
    func delete(key: String) async throws {

    }    
}
