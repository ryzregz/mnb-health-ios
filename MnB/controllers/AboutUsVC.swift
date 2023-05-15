//
//  AboutUsVC.swift
//  MnB
//
//  Created by Morris Murega on 2/20/23.
//

import Foundation
import UIKit
import Slidoo
class AboutUsVC : UIViewController{
    private var presentedViewControllerTransitionAnimator: NavigationDrawerTransitionDelegate?
    
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          let screenEdgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(didPan(panRecognizer:)))
          screenEdgeGesture.edges = view.isRTL ? .right : .left
          view.addGestureRecognizer(screenEdgeGesture)
           // animateIndicators()
      }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @objc func didPan(panRecognizer: UIPanGestureRecognizer) {
            switch panRecognizer.state {
            case .began:
                presentMenu(supportAnimation: false)
            default:
                forwardPanGesture(panRecognizer)
            }
        }
        
        @IBAction func buttonTouched(_ sender: UIBarButtonItem) {
            presentMenu(supportAnimation: true)
        }
    
}

extension AboutUsVC {
    private func forwardPanGesture(_ panRecognizer: UIPanGestureRecognizer) {
        if let presentedVC = presentedViewController as? SliderMenuVC, let presentationController = presentedVC.presentationController as? NavigationDrawerSwipeController {
            presentationController.didPan(panRecognizer: panRecognizer, screenGestureEnabled: true)
        }
    }
    
    private func presentMenu(supportAnimation: Bool) {
        let presentedVC = SliderMenuVC()
        presentedViewControllerTransitionAnimator = nil
        presentedViewControllerTransitionAnimator = NavigationDrawerTransitionDelegate(supportAnimation: supportAnimation)
        presentedVC.transitioningDelegate = presentedViewControllerTransitionAnimator
        presentedVC.modalPresentationStyle = .custom
        present(presentedVC, animated: true)
    }
}
