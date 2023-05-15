//
//  HomeVC.swift
//  MnB
//
//  Created by Morris Murega on 7/16/22.
//

import UIKit
import Slidoo
import ImageSlideshow
class HomeVC: UIViewController {
    
    
    private var presentedViewControllerTransitionAnimator: NavigationDrawerTransitionDelegate?
    
    @IBOutlet weak var handButton: UIBarButtonItem!
    @IBOutlet var slideshow: ImageSlideshow!
    
    let localSource = [BundleImageSource(imageString: "janko"), BundleImageSource(imageString: "eric_froe"), BundleImageSource(imageString: "knee_socks"), BundleImageSource(imageString: "stress_marker")]
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("IN Home VC")
    }
    
    
    
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
        setupNavigationBar()
        setupSlideShow()
    }
    
    @IBAction func toConception(_ sender : Any){
        if let vc = storyboard?.instantiateViewController(identifier: "ConceptionVC") as? ConceptionVC{
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.navigationBar.prefersLargeTitles = true
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    @IBAction func toPregnancy(_ sender : Any){
        if let vc = storyboard?.instantiateViewController(identifier: "PregnancyVC") as? PreganancyVC{
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.navigationBar.prefersLargeTitles = true
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    
    @IBAction func toUsefulTools(_ sender : Any){
        if let vc = storyboard?.instantiateViewController(identifier: "UsefulToolsVC") as? UsefulTools{
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.navigationBar.prefersLargeTitles = true
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    func setupNavigationBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setupSlideShow(){
        slideshow.slideshowInterval = 5.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        slideshow.pageIndicator?.view.tintColor = .systemBlue
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(HomeVC.didTap))
        slideshow.addGestureRecognizer(recognizer)
        
    }
    
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // animateIndicators()
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
    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
}

// MARK: - Helpers
extension HomeVC: ImageSlideshowDelegate {
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
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
