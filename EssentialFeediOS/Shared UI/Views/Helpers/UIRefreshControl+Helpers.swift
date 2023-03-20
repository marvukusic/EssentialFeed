//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 26.10.2022.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
    }
