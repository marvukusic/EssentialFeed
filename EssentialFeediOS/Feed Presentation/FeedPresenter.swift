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
    var feedLoadingView: FeedLoadingView?
    var feedView: FeedView?
    
    private var feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    func loadFeed() {
        feedLoadingView?.display(FeedLoadingViewModel(isLoading: true))
        feedLoader.load { [weak self] result in
            self?.feedLoadingView?.display(FeedLoadingViewModel(isLoading: false))
            if let feed = try? result.get() {
                self?.feedView?.display(FeedViewModel(feed: feed))
            }
        }
    }
}

