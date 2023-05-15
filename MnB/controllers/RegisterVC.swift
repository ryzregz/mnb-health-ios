//
//  RegisterVC.swift
//  MnB
//
//  Created by Morris Murega on 7/16/22.
//

import UIKit

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barTintColor = UIColor.red
    }
    
    
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)

        if parent == nil {
            debugPrint("Back Button pressed.")
        }
    }
    

    @IBAction func backNav(_ sender : Any){
        self.navigationController?.dismiss(animated: true)
    }

}
