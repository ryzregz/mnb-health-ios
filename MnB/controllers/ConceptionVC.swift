//
//  ConceptionVC.swift
//  MnB
//
//  Created by Morris Murega on 2/21/23.
//

import Foundation
import UIKit

class ConceptionVC : UIViewController{
    var topics = [Content]()
    let reuseIdentifier = "contentCell"
    @IBOutlet weak var contentTableview : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentTableview.delegate = self
        self.contentTableview.dataSource = self
        
        getTopics()
    }
    
    func getTopics(){
        let topic1 = Content(title: "", desc: "How long does it take to get pregnant?")
        let topic2 = Content(title: "", desc: "Preparing to get pregnant")
        let topic3 = Content(title: "", desc: "Signs of Ovulation")
        let topic4 = Content(title: "", desc: "Fertility Treatment")
        let topic5 = Content(title: "", desc: "Pregnancy Symptoms")
        let topic6 = Content(title: "", desc: "Workout your due date")
        let topic7 = Content(title: "", desc: "How to identify problems that may prevent you from conceiving")
        
        topics.append(topic1)
        topics.append(topic2)
        topics.append(topic3)
        topics.append(topic4)
        topics.append(topic5)
        topics.append(topic6)
        topics.append(topic7)
        
        
        DispatchQueue.main.async {
            self.contentTableview.reloadData()
        }
        
    }
    
}

extension ConceptionVC : UITableViewDelegate, UITableViewDataSource{
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
