//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 23.01.2023..
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    func save(_ feed: [FeedImage], completion: @escaping (LocalFeedLoader.SaveResult) -> Void)
}
