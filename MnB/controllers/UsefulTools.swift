//
//  UsefulTools.swift
//  MnB
//
//  Created by Morris Murega on 2/22/23.
//

import Foundation
import UIKit

class UsefulTools : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add the bottom sheet view controller as a child view controller
        
    }
    
    @IBAction func ovulationCalc(_sender : Any){
        if let vc = storyboard?.instantiateViewController(identifier: "OlvCalcVC") as? OlvCalcBottomSheetVC{
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.navigationBar.prefersLargeTitles = true
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func dueDateCalc(_sender : Any){
        
    }
    
    
    @IBAction func vaccinationCalc(_sender : Any){
        
    }
}
