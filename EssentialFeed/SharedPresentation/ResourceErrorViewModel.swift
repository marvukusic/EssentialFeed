//
//  ResourceErrorViewModel.swift
//  EssentialFeed
//
//  Created by Marko Vukušić on 26.10.2022.
//

import Foundation

public struct ResourceErrorViewModel {
    public let message: String?
    
    static func noError() -> ResourceErrorViewModel {
        ResourceErrorViewModel(message: .none)
    }
    
    static func error(message: String) -> ResourceErrorViewModel {
        ResourceErrorViewModel(message: message)
    }
}
