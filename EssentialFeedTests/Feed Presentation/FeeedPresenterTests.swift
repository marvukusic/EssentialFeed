//
//  FeeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Marko Vukušić on 26.10.2022.
//

import XCTest

class FeedPresenter {
    private let view: Any
    
    init(view: Any) {
        self.view = view
    }
    
    func didStartLoadingFeed() {
        
    }
}

final class FeeedPresenterTests: XCTestCase {

    func test_init_doesNotSendMessagesToView() {
        let (_, view) = makeSUT()
        XCTAssertTrue(view.messages.isEmpty)
    }
    
    func test_didStartLoadingFeed_displaysNoErrorMessage() {
        let (sut, view) = makeSUT()
        
        sut.didStartLoadingFeed()
        
        XCTAssertTrue(view.messages.isEmpty)
    }
    
    // - MARK: Helpers
    
    private class ViewSpy {
        enum Message {
            case displayErrorMessage(String?)
        }
        
        let messages = [Message]()
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedPresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedPresenter(view: view)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }

}
