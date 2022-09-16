//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 16.09.2022.
//

import Foundation
import EssentialFeed

final class FeedViewModel {
    
    typealias Observer<T> = (T) -> Void
    
    var onLoadingStateChange: Observer<Bool>?
    var onFeedLoad: Observer<[FeedImage]>?
    
    private var feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    func loadFeed() {
        onLoadingStateChange?(true)
        feedLoader.load { [weak self] result in
            self?.onLoadingStateChange?(false)
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
        }
    }
}
