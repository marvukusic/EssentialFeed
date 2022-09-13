//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 13.09.2022.
//

import UIKit
import EssentialFeed

final class FeedRefreshViewController: NSObject {
    private var feedLoader: FeedLoader
    
    var onRefresh: (([FeedImage]) -> Void)?
    
    private(set) lazy var view: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    @objc func refresh() {
        view.beginRefreshing()
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onRefresh?(feed)
            }
            self?.view.endRefreshing()
        }
    }
}
