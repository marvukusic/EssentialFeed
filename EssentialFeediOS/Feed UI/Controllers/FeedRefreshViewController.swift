//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 13.09.2022.
//

import UIKit

final class FeedRefreshViewController: NSObject, FeedLoadingView {
    private let presenter: FeedPresenter
    
    init(presenter: FeedPresenter) {
        self.presenter = presenter
    }
    
    private(set) lazy var view = loadView()
    
    @objc func loadFeed() {
        presenter.loadFeed()
    }
    
    func display(isLoading: Bool) {
        isLoading ? view.beginRefreshing() : view.endRefreshing()
    }
    
    private func loadView() -> UIRefreshControl {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(loadFeed), for: .valueChanged)
        return view
    }
}
