//
//  CiltBakimi.swift
//  sutkodları
//
//  Created by İlyas Abiyev on 7/16/20.
//  Copyright © 2020 İlyas Abiyev. All rights reserved.
//

import UIKit
import Firebase

class CiltBakimi: UIViewController {
    
    @objc var itemlist : [NSDictionary] = []
    
    var searchitemlist : [NSDictionary] = []
    
    var selectedIndex = Int()
    
    let tableView = UITableView()
    
    
    var array = ["Lorem Ipsum is simply dummy text of the printing and typesetting","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type","It was popularised","using 'Content here, content here', making it look like readable English. Many desktop publis","Lorem Ipsum is simply dummy text of the printing and typesettingLorem Ipsum is simply dummy text of the printing and typesettingLorem Ipsum is simply dummy text of the printing and typesettingLorem Ipsum is simply dummy text of the printing and typesetting","Lorem Ipsum is simply dummy text of the printing and typesettingLorem Ipsum is simply dummy text of the printing and typesetting","Lorem Ipsum is simply dummy text of the printing and typesetting","Lorem Ipsum is simply dummy text of the printing and typesettingLorem Ipsum is simply dummy text of the printing and typesettingLorem Ipsum is simply dummy text of the printing and typesettingLorem Ipsum is simply dummy text of the printing and typesetting"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        view.addSubview(tableView)
       
        _ = tableView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "cell1", bundle: nil), forCellReuseIdentifier: "cell1")
    }
    

   

}

extension CiltBakimi : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1") as! cell1
        cell.selectionStyle = .none
        cell.lblLorem.text = array[indexPath.row]
        cell.btnAction = {
            () in
            if self.selectedIndex == indexPath.row {
                self.selectedIndex = 0
            }else{
                self.selectedIndex = indexPath.row
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            
            UIView.animate(withDuration: 0.5) { () -> Void in
                cell.btnImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }
       
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndex == indexPath.row {
           
        }else {
            selectedIndex = indexPath.row
          
        }
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if selectedIndex == indexPath.row {
            
            return UITableView.automaticDimension
        }else {
            
            return 50
            
        }
        
    }
    
    
    func getitemfromDB(query : String,categoryfilter : String){
        
        let userRef = Database.database().reference().child("items")
        
        userRef.observe(.value, with: { (snapshot) in
            
            self.itemlist.removeAll(keepingCapacity: false)
            
            for child in snapshot.children {
                
                let snap = child as! DataSnapshot //get first snapshot
                let value = snap.value as? NSDictionary //get second snapshot
                
                
                let category = value!["category"] as? String ?? ""
                let header = value!["header"] as? String ?? ""
                
                var addcontrol = true
                
                //search filter
                if query != "" && !header.lowercased().contains(query){
                    addcontrol = false
                }
                
                //category filter
                if categoryfilter != "" && category != categoryfilter{
                    addcontrol = false
                }
                
                
                if(addcontrol){
                    self.itemlist.append(value!)
                    self.searchitemlist.append(value!)
                }
                
            }
            
            
          
            
            self.itemlist = self.itemlist.shuffled()
            self.searchitemlist = self.searchitemlist.shuffled()
            self.tableView.reloadData()
            
        })
        
    }
    
    
}
