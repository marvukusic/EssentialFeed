//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 16.08.2022.
//

import Foundation

final class FeedCachePolicy {
    private static var maxCacheAgeInDays: Int { 7 }
    
    private static let calendar = Calendar(identifier: .gregorian)
    
    private init() { }
    
    static func validate(_ timestamp: Date?, against date: Date) -> Bool {
        guard let timestamp = timestamp, let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else { return false }
        return date < maxCacheAge
    }
}
