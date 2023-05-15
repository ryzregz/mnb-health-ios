//
//  ContentCell.swift
//  MnB
//
//  Created by Morris Murega on 2/21/23.
//

import Foundation
import UIKit

class ContentCell : UITableViewCell{
    static let identifier = "contentCell"
    @IBOutlet weak var contentLabel : UILabel!
    
    public func configureCellWith(contentItem : Content){
        contentLabel.text = contentItem.desc
    }
    
}

