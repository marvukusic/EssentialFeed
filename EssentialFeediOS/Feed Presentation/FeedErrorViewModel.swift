//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 26.10.2022.
//

import Foundation

struct FeedErrorViewModel {
    private(set) var message: String?
    
    init(message: String?) {
        self.message = message
    }
    
    static func noError() -> FeedErrorViewModel {
        FeedErrorViewModel(message: .none)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
