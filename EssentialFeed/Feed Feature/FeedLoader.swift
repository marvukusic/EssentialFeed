//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 26.07.2022.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
