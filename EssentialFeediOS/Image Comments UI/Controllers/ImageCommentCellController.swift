//
//  ImageCommentCellController.swift
//  EssentialFeediOS
//
//  Created by Marko Vukušić on 20.03.2023..
//

import UIKit
import EssentialFeed

public class ImageCommentCellController: CellControler {
    private let model: ImageCommentViewModel
    
    public init(model: ImageCommentViewModel) {
        self.model = model
    }
    
    public func view(in tableView: UITableView) -> UITableViewCell {
        let cell: ImageCommentCell = tableView.dequeueReusableCells()
        cell.messageLabel.text = model.message
        cell.usernameLabel.text = model.username
        cell.dateLabel.text = model.date
        return cell
    }
    
    public func preload() {
        
    }
    
    public func cancelLoad() {
        
    }
}
