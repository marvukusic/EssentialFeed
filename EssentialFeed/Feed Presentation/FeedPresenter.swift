//
//  FeedPresenter.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 26.10.2022.
//

import Foundation

public protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}

public class FeedPresenter {
    private let feedView: FeedView
    private let loadingView: ResourceLoadingView
    private let errorView: ResourceErrorView
    
    static public var title: String {
        NSLocalizedString("FEED_VIEW_TITLE",
                          tableName: "Feed",
                          bundle: Bundle(for: FeedPresenter.self),
                          comment: "Title for the feed view")
    }
    
    private var feedLoadError: String {
        NSLocalizedString("GENERIC_CONNECTION_ERROR",
                          tableName: "Shared",
                          bundle: Bundle(for: FeedPresenter.self),
                          comment: "Error message displayed when we can't load the image from the server")
    }
    
    public init(feedView: FeedView, loadingView: ResourceLoadingView, errorView: ResourceErrorView) {
        self.feedView = feedView
        self.loadingView = loadingView
        self.errorView = errorView
    }
    
    public func didStartLoadingFeed() {
        errorView.display(.noError())
        loadingView.display(ResourceLoadingViewModel(isLoading: true))
    }
    
    public func didFinishLoadingFeed(feed: [FeedImage]) {
        feedView.display(Self.map(feed))
        loadingView.display(ResourceLoadingViewModel(isLoading: false))
    }
    
    public func didFinishLoadingFeed(with error: Error) {
        errorView.display(.error(message: feedLoadError))
        loadingView.display(ResourceLoadingViewModel(isLoading: false))
    }
    
    public static func map(_ feed: [FeedImage]) -> FeedViewModel {
        FeedViewModel(feed: feed)
    }
}
