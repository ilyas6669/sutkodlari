//
//  KimyasalSoyma.swift
//  sutkodları
//
//  Created by İlyas Abiyev on 7/16/20.
//  Copyright © 2020 İlyas Abiyev. All rights reserved.
//

import UIKit

class KimyasalSoyma: UIViewController {
    
    fileprivate let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .customBackground()
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        view.addSubview(collectionView)
        
        _ = collectionView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        
        //CollectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "KimyasalCell", bundle: nil), forCellWithReuseIdentifier: "KimyasalCell")
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 5
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: view.frame.width-15, height: 50)
        }
    }
    
    
    
    
}


extension KimyasalSoyma : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KimyasalCell", for: indexPath) as! KimyasalCell
        cell.btnTapAction = {
            () in
           
        }
        
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        return cell
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.collectionView)
       let indexPath = self.collectionView.indexPathForItem(at: location)

       if let index = indexPath {
          print("Got clicked on index: \(index)!")
    
       }
    }
    
    
}
