//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Marko Vukušić on 26.07.2022.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()

        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    func test_load_requestsDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURLs, [url])
    }
    
    func test_load_deliversErrorOnClientError() {
        let (sut, client) = makeSUT()
        let error = NSError(domain: "Test", code: 0)
        client.error.append(error)
        
        var capturedError = [RemoteFeedLoader.Error]()
        sut.load() { capturedError.append($0) }
        
        XCTAssertEqual(capturedError, [.connectivity])
    }
    
    // MARK: - Helpers
    
    class HTTPClientSpy: HTTPClient {
        var requestedURLs = [URL]()
        var error = [Error]()
        
        func get(from url: URL, completion: (Error) -> Void) {
            if let error = error.first {
                completion(error)
            }
            requestedURLs.append(url)
        }
    }

    private func makeSUT(url: URL = URL(string: "https://a-given-url.com")!) -> (RemoteFeedLoader, HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
}

