//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 28.10.2022..
//

import Foundation

public struct FeedImageViewModel{
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        location != nil
    }
}
