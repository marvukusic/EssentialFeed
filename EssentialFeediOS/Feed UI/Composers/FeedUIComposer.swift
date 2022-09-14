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
        feedRefreshViewController.onRefresh = adaptFeedToCellControllers(forwardingTo: feedViewController, loader: imageLoader)
        
        return feedViewController
    }
    
    private static func adaptFeedToCellControllers(forwardingTo controller: FeedViewController, loader: FeedImageDataLoader) -> ([FeedImage]) -> Void {
        return { [weak controller] feed in
            controller?.tableModel = feed.map { FeedImageCellController(model: $0, imageLoader: loader) }
        }
    }
}
