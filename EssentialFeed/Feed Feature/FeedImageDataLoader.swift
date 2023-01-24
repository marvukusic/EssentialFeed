//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 13.09.2022.
//

import Foundation

extension LocalFeedImageDataLoader: FeedImageDataCache {
    public typealias SaveResult = FeedImageDataCache.Result
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}

public protocol FeedImageDataLoaderTask {
    func cancel()
}
