//
//  KimyasalCell.swift
//  sutkodları
//
//  Created by İlyas Abiyev on 7/16/20.
//  Copyright © 2020 İlyas Abiyev. All rights reserved.
//

import UIKit

class KimyasalCell: UICollectionViewCell {
    
    var btnTapAction : (()->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    @IBAction func btn(_ sender: Any) {
         btnTapAction?()
    }
}
