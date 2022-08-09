//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Marko Vukušić on 09.08.2022.
//

import XCTest

class LocalFeedLoader {
    let store: FeedStore
    
    init(store: FeedStore) {
        self.store = store
    }
}

class FeedStore {
    var deletedCachedFeedCount = 0
}

class CacheFeedUseCaseTests: XCTestCase {

    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deletedCachedFeedCount, 0)
    }

}
