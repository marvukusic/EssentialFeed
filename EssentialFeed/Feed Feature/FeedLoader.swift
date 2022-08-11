//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 26.07.2022.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
