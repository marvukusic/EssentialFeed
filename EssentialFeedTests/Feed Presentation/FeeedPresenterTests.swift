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
}

final class FeeedPresenterTests: XCTestCase {

    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        
        _ = FeedPresenter(view: view)
        XCTAssertTrue(view.messages.isEmpty)
    }
    
    // - MARK: Helpers
    
    private class ViewSpy {
        let messages = [Any]()
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
