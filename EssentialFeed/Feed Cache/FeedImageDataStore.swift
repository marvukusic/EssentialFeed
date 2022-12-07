//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 07.12.2022..
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
