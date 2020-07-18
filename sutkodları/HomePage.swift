//
//  HomePage.swift
//  sutkodları
//
//  Created by İlyas Abiyev on 7/19/20.
//  Copyright © 2020 İlyas Abiyev. All rights reserved.
//

import UIKit

class HomePage: UIViewController {
    
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
           let img = UIImageView(image: UIImage(named: ""))
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
           lbl.text = "00.00.0000"
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
       
    var segmentControl: UISegmentedControl = {
       let segment = UISegmentedControl()
        return segment
    }()
       
    var childView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
       
    var childView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        childView.alpha = 1
         childView2.alpha = 0
         
        
          segmentControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
         
         view.backgroundColor = .customBackground2()
         
         view.addSubview(topView)
         
         topView.addSubview(lblSutkodlari)
         
         topView.addSubview(imgLogo)
         
         topView.addSubview(lblHosgeldin)
         
         topView.addSubview(lblTarih)
         
         view.addSubview(searchbar)
         
         
         
         view.addSubview(barView)
         
         barView.addSubview(lblKodu)
         
         barView.addSubview(lblIslemAdi)
         
         barView.addSubview(lblPuan)
         
         view.addSubview(segmentView)
         
         segmentView.addSubview(segmentControl)
         
         _ = topView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor)
         
         _ = lblSutkodlari.anchor(top: topView.topAnchor, bottom: nil, leading: nil, trailing: nil,padding: .init(top: 15, left: 0, bottom: 0, right: 0))
         lblSutkodlari.merkezXSuperView()
         
         _ = imgLogo.anchor(top: topView.topAnchor, bottom: nil, leading: nil, trailing: lblSutkodlari.leadingAnchor,padding: .init(top: 10, left: 0, bottom: 0, right: 10))
         
         lblHosgeldin.merkezKonumlamdirmaSuperView()
         
         _ = lblTarih.anchor(top: lblHosgeldin.bottomAnchor, bottom: nil, leading: nil, trailing: nil,padding: .init(top: 5, left: 0, bottom: 0, right: 0))
         lblTarih.merkezXSuperView()
         
         _ = searchbar.anchor(top: topView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: -22, left: 10, bottom: 0, right: 10))
         
         
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
        
    }
    
    
    
    @objc func actionSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            childView.alpha = 1
            childView2.alpha = 0
        }else{
            childView.alpha = 0
            childView2.alpha = 1
        }
    }
    
    
}
