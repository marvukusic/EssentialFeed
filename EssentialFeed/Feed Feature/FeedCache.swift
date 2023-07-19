//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 23.01.2023..
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
