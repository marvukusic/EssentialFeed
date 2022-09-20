//
//  FeedPresenter.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 20.09.2022.
//

import Foundation
import EssentialFeed

protocol FeedLoadingView: AnyObject {
    func display(isLoading: Bool)
}

protocol FeedView {
    func display(feed: [FeedImage])
}

final class FeedPresenter {
    weak var feedLoadingView: FeedLoadingView?
    var feedView: FeedView?
    
    private var feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    func loadFeed() {
        feedLoadingView?.display(isLoading: true)
        feedLoader.load { [weak self] result in
            self?.feedLoadingView?.display(isLoading: false)
            if let feed = try? result.get() {
                self?.feedView?.display(feed: feed)
            }
        }
    }
}

