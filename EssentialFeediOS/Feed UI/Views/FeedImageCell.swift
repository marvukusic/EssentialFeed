//
//  FeedImageCell.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 07.09.2022.
//

import UIKit
import EssentialFeed

public final class FeedImageCell: UITableViewCell {
    public var onRetry: (() -> Void)?
    
    public let locationContainer = UIView()
    public let descriptionLabel = UILabel()
    public let locationLabel = UILabel()
    public let feedImageContainer = UIView()
    public let feedImageView = UIImageView()
    
    private(set) public lazy var feedImageRetryButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(retryButtonAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func retryButtonAction() {
        onRetry?()
    }
}
