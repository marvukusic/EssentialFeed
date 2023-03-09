//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 28.10.2022..
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(description: image.description,
                           location: image.location)
    }
}
