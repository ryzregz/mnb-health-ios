//
//  LoginVC.swift
//  MnB
//
//  Created by Morris Murega on 7/16/22.
//

import UIKit

class LoginVC: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func navigateToHome(_ sender : Any){
        if let vc = storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeVC{
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.navigationBar.prefersLargeTitles = true
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    

   

}
