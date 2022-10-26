//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Marko Vukušić on 26.10.2022.
//

import XCTest

class FeedImagePresenter {
    private let view: Any
    
    init(view: Any) {
        self.view = view
    }
}

final class FeedImagePresenterTests: XCTestCase {

    func test_init_doesNotSendMessagesToView() {
        let (_, view) = makeSUT()
        
        XCTAssertTrue(view.messages.isEmpty)
    }
    
    class ViewSpy {
        let messages = [Any]()
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedImagePresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedImagePresenter(view: view)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }
}
