//
//  FeedCacheTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Marko Vukušić on 16.08.2022.
//

import Foundation
import EssentialFeed

func uniqueImage() -> FeedImage {
    FeedImage(id: UUID(), description: nil, location: nil, url: anyURL())
}

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let models = [uniqueImage(), uniqueImage()]
    let local = models.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    return (models: models, local: local)
}

extension Date {
    private var feedCacheMaxAgeInDays: Int { 7 }
    
    func minusFeedCacheMaxAge() -> Date {
        self.adding(days: -feedCacheMaxAgeInDays)
    }
}

extension Date {
    func adding(seconds: TimeInterval) -> Date {
        self + seconds
    }
    
    func adding(minutes: Int) -> Date {
        Calendar(identifier: .gregorian).date(byAdding: .minute, value: minutes, to: self)!
    }
    
    func adding(days: Int) -> Date {
        Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self)!
    }
}
