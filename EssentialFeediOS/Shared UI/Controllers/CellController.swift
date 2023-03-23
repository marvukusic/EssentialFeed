//
//  CellController.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 21.03.2023..
//

import UIKit

public struct CellControler {
    let id: AnyHashable
    let dataSource: UITableViewDataSource
    let delegate: UITableViewDelegate?
    let dataSourcePrefetching: UITableViewDataSourcePrefetching?
    
    public init(id: AnyHashable, _ dataSource: UITableViewDataSource & UITableViewDelegate & UITableViewDataSourcePrefetching) {
        self.id = id
        self.dataSource = dataSource
        self.delegate = dataSource
        self.dataSourcePrefetching = dataSource
    }
    
    public init(id: AnyHashable, _ dataSource: UITableViewDataSource) {
        self.id = id
        self.dataSource = dataSource
        self.delegate = nil
        self.dataSourcePrefetching = nil
    }
}

extension CellControler: Equatable {
    public static func == (lhs: CellControler, rhs: CellControler) -> Bool {
        lhs.id == rhs.id
    }
}
extension CellControler: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
