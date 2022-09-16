//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 16.09.2022.
//

import Foundation
import EssentialFeed

final class FeedViewModel {
    
    var onChange: ((FeedViewModel) -> Void)?
    
    var onFeedLoad: (([FeedImage]) -> Void)?
    
    private var feedLoader: FeedLoader
    
    enum State {
        case pending, loading, loaded([FeedImage]), failed
    }
    
    private(set) var isLoading: Bool = false {
        didSet {
            onChange?(self)
        }
    }
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    func loadFeed() {
        isLoading = true
        feedLoader.load { [weak self] result in
            self?.isLoading = false
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
        }
    }
}
