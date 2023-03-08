//
//  SharedLocalizationTests.swift
//  EssentialFeediOSTests
//
//  Created by Marko Vukušić on 28.09.2022.
//

import XCTest
import EssentialFeed

final class SharedLocalizationTests: XCTestCase {

    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Shared"
        let bundle = Bundle(for: LoadResourcePresenter<Any, DummyView>.self)
        assetLocalizedKeyAndValueExist(in: bundle, table)
    }
    
    private class DummyView: ResourceView {
        typealias ResourceViewModel = Any
        
        func display(_ viewModel: ResourceViewModel) {
            
        }
    }
}
