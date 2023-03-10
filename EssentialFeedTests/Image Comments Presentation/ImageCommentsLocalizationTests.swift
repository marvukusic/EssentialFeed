//
//  ImageCommentsLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by Marko Vukušić on 10.03.2023..
//

import XCTest
import EssentialFeed

final class ImageCommentsLocalizationTests: XCTestCase {

    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: ImageCommentsPresenter.self)
        assetLocalizedKeyAndValueExist(in: bundle, table)
    }
}
