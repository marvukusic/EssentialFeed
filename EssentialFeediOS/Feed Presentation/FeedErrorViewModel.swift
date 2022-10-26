//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 26.10.2022.
//

import Foundation

struct FeedErrorViewModel {
    let message: String?
    
    static func noError() -> FeedErrorViewModel {
        FeedErrorViewModel(message: .none)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
