//
//  PregnancyVC.swift
//  MnB
//
//  Created by Morris Murega on 2/22/23.
//

import Foundation
import UIKit

class PreganancyVC : UIViewController{
    @IBOutlet weak var contentTableview : UITableView!
    var topics = [Content]()
    let reuseIdentifier = "contentCell"
    override func viewDidLoad() {
        
        contentTableview.delegate = self
        contentTableview.dataSource = self
        
        getTopics()
        
    }
    
    func getTopics(){
        let topic1 = Content(title: "", desc: "Weekly Pregnancy Updates.")
        let topic2 = Content(title: "", desc: "Pregnancy week by week")
        let topic3 = Content(title: "", desc: "Labour and Child Birth")
        let topic4 = Content(title: "", desc: "Special needs pregnancy and birth")
        let topic5 = Content(title: "", desc: "Antenatal appointments")
        let topic6 = Content(title: "", desc: "Pregnancy Scans")
        
        topics.append(topic1)
        topics.append(topic2)
        topics.append(topic3)
        topics.append(topic4)
        topics.append(topic5)
        topics.append(topic6)
    }
}

extension PreganancyVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? ContentCell{
            cell.configureCellWith(contentItem: topics[indexPath.item])
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}
