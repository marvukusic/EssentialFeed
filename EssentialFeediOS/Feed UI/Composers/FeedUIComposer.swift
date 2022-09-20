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
        let presenter = FeedPresenter(feedLoader: feedLoader)
        let refreshViewController = FeedRefreshViewController(presenter: presenter)
        let feedViewController = FeedViewController(feedRefreshViewController: refreshViewController)
        presenter.feedLoadingView = refreshViewController
        presenter.feedView = FeedViewAdapter(controller: feedViewController, loader: imageLoader)
        return feedViewController
    }
}

private final class FeedViewAdapter: FeedView {
    private weak var controller: FeedViewController?
    private let loader: FeedImageDataLoader
    
    init(controller: FeedViewController, loader: FeedImageDataLoader) {
        self.controller = controller
        self.loader = loader
    }
    
    func display(feed: [EssentialFeed.FeedImage]) {
        controller?.tableModel = feed.map { FeedImageCellController(viewModel: FeedImageViewModel(model: $0, imageLoader: loader, imageTransformer: UIImage.init)) }
    }
}
