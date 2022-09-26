//
//  FeedImageCellViewModel.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 19.09.2022.
//

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        location != nil
    }
}
