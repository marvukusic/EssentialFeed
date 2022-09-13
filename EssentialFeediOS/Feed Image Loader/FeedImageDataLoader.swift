//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 13.09.2022.
//

import Foundation

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}

public protocol FeedImageDataLoaderTask {
    func cancel()
}
