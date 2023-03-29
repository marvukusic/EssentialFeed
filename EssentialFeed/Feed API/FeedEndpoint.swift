//
//  FeedEndpoint.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 29.03.2023..
//

import Foundation

public enum FeedEndpoint {
    case get
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
}
