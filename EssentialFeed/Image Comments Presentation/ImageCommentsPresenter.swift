//
//  ImageCommentsPresenter.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 10.03.2023..
//

import Foundation

public final class ImageCommentsPresenter {
    static public var title: String {
        NSLocalizedString("IMAGE_COMMENTS_VIEW_TITLE",
                          tableName: "ImageComments",
                          bundle: Bundle(for: ImageCommentsPresenter.self),
                          comment: "Title for the feed view")
    }
}

