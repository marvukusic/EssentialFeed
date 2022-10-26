//
//  UITableView+Dequeing.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 26.09.2022.
//

import UIKit

extension UITableView {
    func dequeueReusableCells<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
