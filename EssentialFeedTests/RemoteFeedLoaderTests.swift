//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Marko Vukušić on 26.07.2022.
//

import XCTest

class RemoteFeedLoaderTests: XCTestCase {
    
    class RemoteFeedLoader {
        
    }
    
    class HTTPClient {
        var requestedURL: URL?
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
//        sut.load()
        
        XCTAssertNil(client.requestedURL)
    }

}
