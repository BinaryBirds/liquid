//
//  MockObjectStorage.swift
//  LiquidTests
//
//  Created by Tibor Bodecs on 2023. 01. 17..
//

import LiquidKit

struct MockObjectStorage: ObjectStorage {
    
    var context: ObjectStorageContext
    
    func createChecksumCalculator() -> ChecksumCalculator {
        MockChecksumCalculator()
    }
    
    func resolve(key: String) -> String {
        ""
    }
    
    func upload(key: String, buffer: ByteBuffer, checksum: String?) async throws {
        
    }
    
    func exists(key: String) async -> Bool {
        true
    }
    
    func download(key source: String, range: ClosedRange<UInt>?) async throws -> ByteBuffer {
        .init()
    }
    
    func copy(key: String, to: String) async throws {
        
    }
    
    func move(key: String, to: String) async throws {
        
    }
    
    func list(key: String?) async throws -> [String] {
        []
    }
    
    func delete(key: String) async throws {
        
    }
    
    func create(key: String) async throws {
        
    }
    
    func createMultipartUpload(key: String) async throws -> MultipartUpload.ID {
        .init("")
    }
    
    func uploadMultipartChunk(key: String, buffer: ByteBuffer, uploadId: MultipartUpload.ID, partNumber: Int) async throws -> MultipartUpload.Chunk {
        .init(id: "", number: 1)
    }
    
    func cancelMultipartUpload(key: String, uploadId: MultipartUpload.ID) async throws {
        
    }
    
    func completeMultipartUpload(key: String, uploadId: MultipartUpload.ID, checksum: String?, chunks: [MultipartUpload.Chunk]) async throws {
        
    }
    

}
