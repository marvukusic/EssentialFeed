//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 28.07.2022.
//

import Foundation

public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>

public extension RemoteFeedLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: FeedItemsMapper.map)
    }
}
