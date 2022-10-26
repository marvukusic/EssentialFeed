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

}
