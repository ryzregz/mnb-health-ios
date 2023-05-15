//
//  DrawerCell.swift
//  MnB
//
//  Created by Morris Murega on 7/16/22.
//

import Foundation
import UIKit
class DrawerCell: UITableViewCell {
    static let identifier = "cellID"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red:0.0, green: 188.0, blue: 254.0, alpha: 1.0 )
        contentView.backgroundColor = UIColor(red:0.0, green: 188.0, blue: 254.0, alpha: 1.0 )
        textLabel?.textColor = .white
        textLabel?.font = UIFont(name: "Futura Medium ", size: 18.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
