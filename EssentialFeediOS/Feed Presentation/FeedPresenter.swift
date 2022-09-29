//
//  FeedPresenter.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 20.09.2022.
//

import Foundation
import EssentialFeed

struct FeedLoadingViewModel {
    let isLoading: Bool
}

protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)
}

struct FeedViewModel {
    let feed: [FeedImage]
}

protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}

final class FeedPresenter {
    private let feedLoadingView: FeedLoadingView
    private let feedView: FeedView
    
    static var title: String {
        NSLocalizedString("FEED_VIEW_TITLE",
                          tableName: "Feed",
                          bundle: Bundle(for: Self.self),
                          comment: "Title for the feed view")
    }
    
    init(feedLoadingView: FeedLoadingView, feedView: FeedView) {
        self.feedLoadingView = feedLoadingView
        self.feedView = feedView
    }
    
    func didStartLoadingFeed() {
        guard Thread.isMainThread else { return DispatchQueue.main.async { [weak self] in
            self?.didStartLoadingFeed()
        } }
        feedLoadingView.display(FeedLoadingViewModel(isLoading: true))
    }
    
    func didFinishLoadingFeed(feed: [FeedImage]) {
        guard Thread.isMainThread else { return DispatchQueue.main.async { [weak self] in
            self?.didFinishLoadingFeed(feed: feed)
        } }
        feedView.display(FeedViewModel(feed: feed))
        feedLoadingView.display(FeedLoadingViewModel(isLoading: false))
    }
    
    func didFinishLoadingFeed(with error: Error) {
        guard Thread.isMainThread else { return DispatchQueue.main.async { [weak self] in
            self?.didFinishLoadingFeed(with: error)
        } }
        feedLoadingView.display(FeedLoadingViewModel(isLoading: false))
    }
}

