//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 13.09.2022.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
