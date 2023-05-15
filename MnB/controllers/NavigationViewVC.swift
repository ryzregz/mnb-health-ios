//
//  NavigationViewVC.swift
//  TestApp
//
//  Created by Bourne Koloh on 21/02/2023.
//

import UIKit

class NavigationViewController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        
        self.navigationBar.backIndicatorImage = UIImage(named: "arrow-left")
        self.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "arrow-left")
        //
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = UIColor.red

                //
        //        let frame = CGRect(origin: .zero, size: CGSize(width: navigationBar.frame.width, height: (navigationBar.frame.height + UIApplication.shared.statusBarFrame.height) ))
        //        //
        //        if let img = //UIImage(named: "bg-orange-gr"){
        //            AppUtils.createBarGradeint(frame,anchor:self.view,applyPoints:true){
        //            //
        //            self.navigationBar.barTintColor = UIColor(patternImage: img)
        //        }else{
        //            self.navigationBar.barTintColor = Globals.colorPrimaryDark
        //        }
        if #available(iOS 12.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                // User Interface is Dark
                self.navigationBar.barTintColor = .brown
            } else {
                // User Interface is Light
                self.navigationBar.barTintColor = UIColor(red: 25.0/255, green: 95.0/255, blue: 226.0/255, alpha: 1.0)
            }
        } else {
            // Fallback on earlier versions
            self.navigationBar.barTintColor = .brown
        }
                
        //
        self.navigationBar.barStyle = .blackTranslucent
        //
        self.navigationBar.prefersLargeTitles = true
        //Work-around for black background
        self.view.backgroundColor = self.navigationBar.barTintColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //
        let navigationBack = UIView()
        if navigationItem.searchController?.isActive == false {
            navigationBack.frame = self.navigationController?.navigationBar.frame ?? CGRect.zero
        }
        navigationBack.backgroundColor = navigationController?.navigationBar.barTintColor
        let containerView = transitionCoordinator?.containerView
        //
        transitionCoordinator?.animateAlongsideTransition(in: containerView, animation: { (context) in
            containerView?.addSubview(navigationBack)
            navigationBack.frame.size.height += self.navigationItem.searchController?.searchBar.frame.height ?? 0
        }, completion: { (context) in
            navigationBack.removeFromSuperview()
        })
        
        //
        super.viewWillAppear(animated)
        
        //
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        
        //
        let fontDictionary = [ NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "Arial", size: CGFloat(22))]
        self.navigationBar.titleTextAttributes = fontDictionary
        //
        self.navigationBar.largeTitleTextAttributes = fontDictionary
        
        
    }
}
