import XCTest
import Vapor
import Liquid

final class LiquidTests: XCTestCase {

    func testExample() async throws {
        let app = Application(.testing)
        
        app.fileStorages.use(
            .init {
                MockFileStorageDriverConfiguration()
            },
            as: .init(string: "mock")
        )
        
        _ = try await app.fileStorage.upload(key: "foo", data: .init())
    }
}
