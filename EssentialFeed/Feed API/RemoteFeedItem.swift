//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 11.08.2022.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
