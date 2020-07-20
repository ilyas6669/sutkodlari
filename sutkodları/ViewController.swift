//
//  ViewController.swift
//  sutkodları
//
//  Created by İlyas Abiyev on 7/16/20.
//  Copyright © 2020 İlyas Abiyev. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var activityIndicator : UIActivityIndicatorView = {
          var indicator = UIActivityIndicatorView()
          indicator.hidesWhenStopped = true
          indicator.style = .medium
          indicator.color = .white
          indicator.translatesAutoresizingMaskIntoConstraints = false
          return indicator
      }()
    
    let topView : UIView = {
        let view = UIView()
        view.backgroundColor = .customBlue()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return view
    }()
    
    let lblSutkodlari : UILabel = {
        let lbl = UILabel()
        lbl.text = "sutkodları"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor  = .white
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let imgLogo : UIImageView = {
        let img = UIImageView(image: UIImage(named: "logopng"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 40).isActive = true
        img.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return img
    }()
    
    let lblHosgeldin : UILabel = {
        let lbl = UILabel()
        lbl.text = "SUT KODLARI'NA HOŞ GELDİN"
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor  = .white
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let lblTarih : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.textColor  = .white
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let searchBarView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return view
    }()
    
    let searchbar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Arama Yap"
        searchBar.isTranslucent = true
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.layer.masksToBounds = true
        return searchBar
    }()
    
    let searchbar2 : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.layer.cornerRadius = 15
        searchBar.placeholder = "Arama Yap"
        searchBar.isTranslucent = true
        return searchBar
    }()
    
    let barView : UIView = {
        let view = UIView()
        view.backgroundColor = .customTabBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    let lblKodu : UILabel = {
        let lbl = UILabel()
        lbl.text = "Kodu"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textColor  = .gray
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let lblIslemAdi : UILabel = {
        let lbl = UILabel()
        lbl.text = "İşlem Adı"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textColor  = .gray
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let lblPuan : UILabel = {
        let lbl = UILabel()
        lbl.text = "Puanı"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textColor  = .gray
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    let segmentView : UIView = {
        let view = UIView()
        view.backgroundColor = .customTabBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var childView: UIView!
    
    @IBOutlet weak var childView2: UIView!
    
    let tableView = UITableView()
    
    let tableView2 = UITableView()
    
    var selectedIndex = Int()
    
    var itemlist : [NSDictionary] = []
    
    var searchitemlist : [NSDictionary] = []
    
    var itemlist2 : [NSDictionary] = []
    
    var searchitemlist2 : [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        childView.alpha = 1
        childView2.alpha = 0
        searchbar.alpha = 1
        searchbar2.alpha = 0
        
        segmentControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
        view.backgroundColor = .customBackground2()
        
        view.addSubview(topView)
        
        topView.addSubview(lblSutkodlari)
        
        topView.addSubview(imgLogo)
        
        topView.addSubview(lblHosgeldin)
        
        topView.addSubview(lblTarih)
        
        view.addSubview(searchbar)
        
        view.addSubview(searchbar2)
        
        view.addSubview(barView)
        
        barView.addSubview(lblKodu)
        
        barView.addSubview(lblIslemAdi)
        
        barView.addSubview(lblPuan)
        
        view.addSubview(segmentView)
        
        segmentView.addSubview(segmentControl)
        
        childView.addSubview(tableView)
        
        childView2.addSubview(tableView2)
        
        view.addSubview(activityIndicator)
        
        _ = topView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        _ = lblSutkodlari.anchor(top: topView.topAnchor, bottom: nil, leading: nil, trailing: nil,padding: .init(top: 15, left: 0, bottom: 0, right: 0))
        lblSutkodlari.merkezXSuperView()
        
        _ = imgLogo.anchor(top: topView.topAnchor, bottom: nil, leading: nil, trailing: lblSutkodlari.leadingAnchor,padding: .init(top: 10, left: 0, bottom: 0, right: 10))
        
        lblHosgeldin.merkezKonumlamdirmaSuperView()
        
        _ = lblTarih.anchor(top: lblHosgeldin.bottomAnchor, bottom: nil, leading: nil, trailing: nil,padding: .init(top: 5, left: 0, bottom: 0, right: 0))
        lblTarih.merkezXSuperView()
        
        _ = searchbar.anchor(top: topView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: -22, left: 10, bottom: 0, right: 10))
        
         _ = searchbar2.anchor(top: topView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: -22, left: 10, bottom: 0, right: 10))
        
        
        _ = barView.anchor(top: searchbar.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 15, left: 10, bottom: 0, right: 10))
        
        _ = lblKodu.anchor(top: nil, bottom: nil, leading: barView.leadingAnchor, trailing: nil,padding: .init(top: 0, left: 15, bottom: 0, right: 0))
        lblKodu.merkezYSuperView()
        
        _ = lblIslemAdi.anchor(top: nil, bottom: nil, leading: lblKodu.trailingAnchor, trailing: nil,padding: .init(top: 0, left: 40, bottom: 0, right: 0))
        lblIslemAdi.merkezYSuperView()
        
        _ = lblPuan.anchor(top: nil, bottom: nil, leading: nil, trailing: barView.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 15))
        lblPuan.merkezYSuperView()
        
        _ = segmentView.anchor(top: barView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        
        _ = childView.anchor(top: segmentView.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        _ = childView2.anchor(top: segmentView.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        _ = segmentControl.anchor(top: segmentView.topAnchor, bottom: segmentView.bottomAnchor, leading: segmentView.leadingAnchor, trailing: segmentView.trailingAnchor)
        
        _ = tableView.anchor(top: childView.topAnchor, bottom: childView.bottomAnchor, leading: childView.leadingAnchor, trailing: childView.trailingAnchor)
        
        _ = tableView2.anchor(top: childView2.topAnchor, bottom: childView2.bottomAnchor, leading: childView2.leadingAnchor, trailing: childView2.trailingAnchor)
        
        _ = activityIndicator.anchor(top: lblSutkodlari.bottomAnchor, bottom: nil, leading: nil, trailing: nil,padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        activityIndicator.merkezXSuperView()
        activityIndicator.startAnimating()
        
        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "cell1", bundle: nil), forCellReuseIdentifier: "cell1")
        tableView.backgroundColor = .customBackground()
        tableView.keyboardDismissMode = .onDrag
        
        
        //TableView2
        tableView2.delegate = self
        tableView2.dataSource = self
        tableView2.register(UINib(nibName: "cell1", bundle: nil), forCellReuseIdentifier: "cell1")
         tableView2.backgroundColor = .customBackground()
        tableView2.keyboardDismissMode = .onDrag
        
        //SearchBar
        searchitemlist = itemlist
        searchbar.delegate = self
        searchbar2.delegate = self
        
         getitemfromDB(query: "", categoryfilter: "")
        getitemfromDB2(query: "", categoryfilter: "")
        getveri()
        
        
        let gestureREcongizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gestureREcongizer.delegate = self
        view.addGestureRecognizer(gestureREcongizer)
        
        topView.isHidden = false
    }
    
    @objc func hideKeyboard() {
           view.endEditing(true)
           
       }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = UIColor.customBlue()
            view.addSubview(statusbarView)
            
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
            
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = UIColor.customBlue()
        }
    }
    
    
    @IBAction func actionSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            childView.alpha = 1
            childView2.alpha = 0
            searchbar.alpha = 1
            searchbar2.alpha = 0
        }else{
            childView.alpha = 0
            childView2.alpha = 1
            searchbar.alpha = 0
            searchbar2.alpha = 1
        }
    }
    
    
    func getveri(){
        let userRef = Database.database().reference().child("info")
        
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            
            let tarih = value?["tarih"] as? String ?? ""
            
            
            self.lblTarih.text = tarih
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
    }
    
}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView2 {
            return itemlist2.count
        }
        return itemlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView2 {
            let cell : cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1") as! cell1
            cell.selectionStyle = .none
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
            
            let value2 = self.itemlist2[indexPath.row]
            
            let count = value2["count"] as? String ?? ""
            let description = value2["description"] as? String ?? ""
            let extrainfo = value2["extrainfo"] as? String ?? ""
            let header = value2["header"] as? String ?? ""
            let Value = value2["value"] as? String ?? ""
            
            cell.lblCount.text = count
            cell.lblLorem.text = description
            cell.lblExtrainfo.text = extrainfo
            cell.lblHeader.text = header
            cell.lblValue.text = Value
            activityIndicator.stopAnimating()
            return cell
           
        }
        let cell2 : cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1") as! cell1
        cell2.selectionStyle = .none
        cell2.btnAction = {
            () in
            if self.selectedIndex == indexPath.row {
                self.selectedIndex = 0
            }else{
                self.selectedIndex = indexPath.row
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            
            UIView.animate(withDuration: 0.5) { () -> Void in
                cell2.btnImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }
            
        }
        
        let value2 = self.itemlist[indexPath.row]
        
        let count = value2["count"] as? String ?? ""
        let description = value2["description"] as? String ?? ""
        let extrainfo = value2["extrainfo"] as? String ?? ""
        let header = value2["header"] as? String ?? ""
        let Value = value2["value"] as? String ?? ""
        
        cell2.lblCount.text = count
        cell2.lblLorem.text = description
        cell2.lblExtrainfo.text = extrainfo
        cell2.lblHeader.text = header
        cell2.lblValue.text = Value
        return cell2
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if self.selectedIndex == indexPath.row {
            self.selectedIndex = 0
        }else{
            self.selectedIndex = indexPath.row
        }
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if selectedIndex == indexPath.row {
            
            return UITableView.automaticDimension
        }else {
            
            return 58
            
        }
        
    }
    
    //budu
    func getitemfromDB(query : String,categoryfilter : String){
        
        let userRef = Database.database().reference().child("Items").child("kimyasalsoyma")
        
        userRef.observe(.value, with: { (snapshot) in
            //brat indi bilsen nece eliyiriy birdefe veri cekeciy hamsini ele gosterecik bu 2 denesini sil ona gore yeni cemi 1 dene collectionview olsun o kategori yerlerinde sil ta denen hoqqadiki tasarim neter olacax be bidene collection view fso ? sen mene apk atardin men baxb eliy erdimde gerey birinci tasarimi yoxe cox sey yoxdu tak tak yazacig demeli wpdan atiram indi birinci ona bax at COLLECTION VIEW BE INDIKI KIMI OLMAYACAX? indi kimi olacag bir iki seyi deyiscik tasarimi silme fsyo tasarimi deyisirem onda atdigjn kimi elirem yaxsi ele 
            self.itemlist.removeAll(keepingCapacity: false)
            
            for child in snapshot.children {
                
                let snap = child as! DataSnapshot //get first snapshot
                let value = snap.value as? NSDictionary //get second snapshot
                
                let header = value!["header"] as? String ?? ""
               
                
                var addcontrol = true
                
                //search filter
                if query != "" && !header.lowercased().contains(query){
                    addcontrol = false
                }
                
//                //category filter
//                if categoryfilter != "" && category != categoryfilter{
//                    addcontrol = false
//                }
                
                
                if(addcontrol){
                    self.itemlist.append(value!)
                    self.searchitemlist.append(value!)
                }
                
            }
            
            
            //itemlist size control
            if self.itemlist.count == 0 { //urun yoxdu
               
            }else{ //urun var
                
            }
            
            self.itemlist = self.itemlist.shuffled()
            self.searchitemlist = self.searchitemlist.shuffled()
            self.tableView.reloadData()
            
        })
        
    }
    
    
    func getitemfromDB2(query : String,categoryfilter : String){
        
        let userRef = Database.database().reference().child("Items").child("ciltbakimi")
        
        userRef.observe(.value, with: { (snapshot) in
            
            self.itemlist2.removeAll(keepingCapacity: false)
            
            for child in snapshot.children {
                
                let snap = child as! DataSnapshot //get first snapshot
                let value = snap.value as? NSDictionary //get second snapshot
                
                let header = value!["header"] as? String ?? ""
                
                
                var addcontrol = true
                
                //search filter
                if query != "" && !header.lowercased().contains(query){
                    addcontrol = false
                }
                
                //                //category filter
                //                if categoryfilter != "" && category != categoryfilter{
                //                    addcontrol = false
                //                }
                
                
                if(addcontrol){
                    self.itemlist2.append(value!)
                    self.searchitemlist2.append(value!)
                }
                
            }
            
            
            //itemlist size control
            if self.itemlist.count == 0 { //urun yoxdu
                
            }else{ //urun var
                
            }
            
            self.itemlist2 = self.itemlist2.shuffled()
            self.searchitemlist2 = self.searchitemlist2.shuffled()
            self.tableView2.reloadData()
            
        })
        
    }
    
    func tableView(_ tableView: UITableView,willDisplay cell: UITableViewCell,forRowAt indexPath: IndexPath){
        
        if tableView == tableView2 {
            if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 8 || indexPath.row == 9 || indexPath.row == 10{
                
            }else{
                
            }
        }
      
    }
    
    
    
    
}

extension ViewController : UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
   
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar == searchbar2 {
            if searchBar.text == "" {
                searchBar.resignFirstResponder()
            }else{
                getitemfromDB2(query: (searchBar.text?.lowercased())!, categoryfilter: "")
                searchBar.resignFirstResponder()
            }
        }
        if searchBar.text == "" {
            searchBar.resignFirstResponder()
        }else{
            getitemfromDB(query: (searchBar.text?.lowercased())!, categoryfilter: "")
            searchBar.resignFirstResponder()
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar == searchbar2 {
            if searchText == "" {
                getitemfromDB2(query: "", categoryfilter: "")
            }
        }
        
        if searchText == "" {
            getitemfromDB(query: "", categoryfilter: "")
        }
        
        
    }
    
}



extension ViewController : UIGestureRecognizerDelegate {

func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    if touch.view?.isDescendant(of: self.tableView) == true {
        return false
    } else if
        touch.view?.isDescendant(of: self.tableView2) == true {
        return false
    } else {
        view.endEditing(true)
        return true
    }
}
}
