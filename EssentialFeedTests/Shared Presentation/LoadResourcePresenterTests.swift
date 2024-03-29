//
//  LoadResourcePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Marko Vukušić on 08.03.2023..
//

import XCTest
import EssentialFeed

final class LoadResourcePresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let (_, view) = makeSUT()
        XCTAssertTrue(view.messages.isEmpty)
    }
    
    func test_didStartLoading_displaysNoErrorMessageAndStartsLoading() {
        let (sut, view) = makeSUT()
        
        sut.didStartLoading()
        
        XCTAssertEqual(view.messages, [.display(errorMessage: .none), .display(isLoading: true)])
    }
    
    func test_didFinishLoadingResource_dispaysResourceAndStopsLoading() {
        let (sut, view) = makeSUT(mapper: { resource in "\(resource) view model" })
        
        sut.didFinishLoading(with: "resource")
        
        XCTAssertEqual(view.messages, [.display(resourceViewModel: "resource view model"), .display(isLoading: false)])
    }
    
    func test_didFinishLoadingWithMapperError_dispaysLocalizedErrorMessageAndStopsLoading() {
        let (sut, view) = makeSUT(mapper: { resource in throw anyNSError() })
        
        sut.didFinishLoading(with: "resource")
        
        XCTAssertEqual(view.messages, [.display(errorMessage: localized("GENERIC_CONNECTION_ERROR", table: "Shared")), .display(isLoading: false)])
    }
    
    func test_didFinishLoadingWithError_dispaysLocalizedErrorMessageAndStopsLoading() {
        let (sut, view) = makeSUT()
        let error = anyNSError()
        
        sut.didFinishLoading(with: error)
        
        XCTAssertEqual(view.messages, [.display(errorMessage: localized("GENERIC_CONNECTION_ERROR", table: "Shared")), .display(isLoading: false)])
    }
    
    // MARK: - Helpers
    private typealias SUT = LoadResourcePresenter<String, ViewSpy>
    
    private func makeSUT(mapper: @escaping SUT.Mapper = { _ in "any"}, file: StaticString = #file, line: UInt = #line) -> (sut: SUT, view: ViewSpy) {
        let view = ViewSpy()
        let sut = SUT(resourceView: view, loadingView: view, errorView: view, mapper: mapper)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }
    
    private func localized(_ key: String, table: String = "Feed", file: StaticString = #file, line: UInt = #line) -> String {
        let bundle = Bundle(for: SUT.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if (value == key) {
            XCTFail("Missing localized string key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }
    
    private class ViewSpy: ResourceErrorView, ResourceLoadingView, ResourceView {
        typealias ResourceViewModel = String
        
        enum Message: Hashable {
            case display(errorMessage: String?)
            case display(isLoading: Bool)
            case display(resourceViewModel: String)
        }
        
        private(set) var messages = Set<Message>()
        
        func display(_ viewModel: ResourceErrorViewModel) {
            messages.insert(.display(errorMessage: viewModel.message))
        }
        
        func display(_ viewModel: ResourceLoadingViewModel) {
            messages.insert(.display(isLoading: viewModel.isLoading))
        }
        
        func display(_ viewModel: String) {
            messages.insert(.display(resourceViewModel: viewModel))
        }
    }
}
