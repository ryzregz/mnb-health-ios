//
//  Extensions.swift
//  MnB
//
//  Created by Morris Murega on 2/21/23.
//

import Foundation
import UIKit
let mainColor = UIColor(red:0.0, green: 188.0, blue: 254.0, alpha: 1.0 )
let titleColor = UIColor(red:0.0, green: 188.0, blue: 254.0, alpha: 1.0 )
extension UINavigationBar {
    func customNavigationBar() {
        // color for button images, indicators and etc.
        self.tintColor = mainColor

        // color for background of navigation bar
        // but if you use larget titles, then in viewDidLoad must write
        // navigationController?.view.backgroundColor = // your color
        self.barTintColor = .white
        self.isTranslucent = false

        // for larget titles
        self.prefersLargeTitles = true

        // color for large title label
        self.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]

        // color for standard title label
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]

        // remove bottom line/shadow
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
    }
}
