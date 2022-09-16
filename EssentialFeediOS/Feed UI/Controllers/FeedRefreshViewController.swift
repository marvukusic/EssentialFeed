//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 13.09.2022.
//

import UIKit

final class FeedRefreshViewController: NSObject {
    let viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
    
    private(set) lazy var view = binded(UIRefreshControl())
    
    @objc func loadFeed() {
        viewModel.loadFeed()
    }
    
    private func binded(_ view: UIRefreshControl) -> UIRefreshControl {
        viewModel.onChange = { viewModel in
            viewModel.isLoading ? view.beginRefreshing() : view.endRefreshing()
        }
        view.addTarget(self, action: #selector(loadFeed), for: .valueChanged)
        return view
    }
}
