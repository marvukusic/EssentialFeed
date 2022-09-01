//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 26.07.2022.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
