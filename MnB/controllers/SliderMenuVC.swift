//
//  SliderMenuVC.swift
//  MnB
//
//  Created by Morris Murega on 7/16/22.
//

import UIKit

class SliderMenuVC: UIViewController {
    private let tableViewData = [
           "M&B Health",
           "About Us",
           "Our Vision",
           "Our Mission",
           "Our Core Values"
       ]
       
       private lazy var headerView: DrawerHeader = {
           let header = DrawerHeader(profileImage: UIImage(named: "pic"))
           header.translatesAutoresizingMaskIntoConstraints = false
           return header
       }()
       
       private lazy var tableView: UITableView = {
           let tableView = UITableView(frame: .zero)
           tableView.separatorStyle = .none
           tableView.translatesAutoresizingMaskIntoConstraints = false
           return tableView
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = UIColor(red:0.0, green: 188.0, blue: 254.0, alpha: 1.0 )
           setupHeaderView()
           setupTableView()
       }
       
       private func setupHeaderView() {
           view.addSubview(headerView)
           
           var topConstraint: NSLayoutConstraint?
           if #available(iOS 11.0, *) {
               topConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
           } else {
               topConstraint = headerView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor)
           }
           [headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           headerView.heightAnchor.constraint(equalToConstant: 150),
           topConstraint].compactMap{ $0 }.forEach { $0.isActive = true }
       }
       
       private func setupTableView() {
           view.addSubview(tableView)
           [tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
               ].forEach { $0.isActive = true }
           tableView.delegate = self
           tableView.dataSource = self
           tableView.isUserInteractionEnabled = true
           tableView.allowsSelection = true
           tableView.register(DrawerCell.self, forCellReuseIdentifier: DrawerCell.identifier)
           tableView.backgroundColor = UIColor(red:0.0, green: 188.0, blue: 254.0, alpha: 1.0 )
       }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
   }

   extension SliderMenuVC: UITableViewDataSource, UITableViewDelegate {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return tableViewData.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: DrawerCell.identifier, for: indexPath) as? DrawerCell
               else { return UITableViewCell() }
           return cell
       }
       
       func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           cell.textLabel?.text = tableViewData[indexPath.item]
           print("\(tableViewData[indexPath.item])")
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let selectedttile = tableViewData[indexPath.item]
               print("Selected \(selectedttile)")
             navigate(selectedttile:selectedttile)
       }

   }

extension SliderMenuVC{
   func  navigate(selectedttile : String){
       print("Selected VC \(selectedttile)")
       if selectedttile == "M&B Health"{
           if let vc = storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeVC{
               let navigationController = UINavigationController(rootViewController: vc)
               navigationController.modalPresentationStyle = .fullScreen
               self.present(navigationController, animated: true, completion: nil)
           }
       }else if selectedttile == "About Us"{
           if let vc = storyboard?.instantiateViewController(identifier: "AboutUsVC") as? AboutUsVC{
               let navigationController = UINavigationController(rootViewController: vc)
               navigationController.modalPresentationStyle = .fullScreen
               self.present(navigationController, animated: true, completion: nil)
           }
       }
       
    }
}
