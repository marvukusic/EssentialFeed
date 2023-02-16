//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 14.02.2023..
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
