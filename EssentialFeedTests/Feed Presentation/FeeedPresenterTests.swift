//
//  FeeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Marko Vukušić on 26.10.2022.
//

import XCTest
import EssentialFeed

final class FeeedPresenterTests: XCTestCase {
    
    func test_title_isLocalized() {
        XCTAssertEqual(FeedPresenter.title, localized("FEED_VIEW_TITLE"))
    }
    
    // MARK: - Helpers
    
    private func localized(_ key: String, file: StaticString = #file, line: UInt = #line) -> String {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if (value == key) {
            XCTFail("Missing localized string key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }
}
