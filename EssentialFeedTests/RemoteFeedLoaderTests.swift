//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Marko Vukušić on 26.07.2022.
//

import XCTest

class RemoteFeedLoaderTests: XCTestCase {
    
    class RemoteFeedLoader {
        func load() {
            HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
        }
    }
    
    class HTTPClient {
        
        static var shared = HTTPClient()
        
        func get(from url: URL) {}
    }
    
    class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        
        override func get(from url: URL) {
            requestedURL = url
        }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }

}
