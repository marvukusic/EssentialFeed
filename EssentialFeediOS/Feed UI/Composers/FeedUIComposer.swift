//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 14.09.2022.
//

import UIKit
import EssentialFeed

final public class FeedUIComposer {
    private init() {}
    
    public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        
        let feedRefreshViewController = FeedRefreshViewController(feedLoader: feedLoader)
        let feedViewController = FeedViewController(feedRefreshViewController: feedRefreshViewController)
        feedRefreshViewController.onRefresh = { [weak feedViewController] feed in
            feedViewController?.tableModel = feed.map { FeedImageCellController(model: $0, imageLoader: imageLoader) }
        }
        
        return feedViewController
    }
}
