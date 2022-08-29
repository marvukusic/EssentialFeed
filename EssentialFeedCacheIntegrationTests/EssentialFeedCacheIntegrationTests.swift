//
//  EssentialFeedCacheIntegrationTests.swift
//  EssentialFeedCacheIntegrationTests
//
//  Created by Marko Vukušić on 29.08.2022.
//

import XCTest
import EssentialFeed

class EssentialFeedCacheIntegrationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        setupEmptyStoreState()
    }
    
    override func tearDown() {
        super.tearDown()
        
        undoStoreSideEffects()
    }

    func test_load_deliversNoItemsOnEmptyCache() {
        let sut = makeSUT()
        
        let exp = expectation(description: "Wait for load")
        sut.load { result in
            switch result {
            case let .success(feedImage):
                XCTAssertEqual(feedImage, [])
            case .failure:
                XCTFail("Expected success, but received \(result)")
            }
            
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_load_deliversItemsSavedOnASeparateInstance() {
        let sutToPerformSave = makeSUT()
        let feed = uniqueImageFeed().models
        
        let saveExp = expectation(description: "Waiting for save")
        sutToPerformSave.save(feed) { saveError in
            XCTAssertNil(saveError, "Error saving feed")
            saveExp.fulfill()
        }
        wait(for: [saveExp], timeout: 1.0)
        
        let sutToPerformLoad = makeSUT()
        let loadExp = expectation(description: "Waiting for load")
        sutToPerformLoad.load { loadResult in
            switch loadResult {
            case let .success(imageFeed):
                XCTAssertEqual(imageFeed, feed)
            case .failure:
                XCTFail("Expected success, but received \(loadResult)")
            }

            loadExp.fulfill()
        }
        wait(for: [loadExp], timeout: 1.0)
    }

    //MARK: - Helpers
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> LocalFeedLoader {
        let storeURL = testSpecificStoreURL()
        let store = try! CoreDataFeedStore(storeURL: storeURL)
        let sut = LocalFeedLoader(store: store, currentDate: Date.init)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return sut
    }
    
    private func setupEmptyStoreState() {
        deleteStoreArtifacts()
    }
    
    private func undoStoreSideEffects() {
        deleteStoreArtifacts()
    }
    
    private func deleteStoreArtifacts() {
        try? FileManager.default.removeItem(at: testSpecificStoreURL())
    }
    
    private func testSpecificStoreURL() -> URL {
        cachesDirectory().appendingPathComponent("\(type(of: self)).store")
    }
    
    private func cachesDirectory() -> URL {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
}
