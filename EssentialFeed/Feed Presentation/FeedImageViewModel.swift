//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 28.10.2022..
//

import Foundation

public struct FeedImageViewModel<Image> {
    public let description: String?
    public let location: String?
    public let image: Image?
    public let isLoading: Bool
    public let shouldRetry: Bool
    
    public var hasLocation: Bool {
        location != nil
    }
}
