//
//  cell1.swift
//  sutkodları
//
//  Created by İlyas Abiyev on 7/18/20.
//  Copyright © 2020 İlyas Abiyev. All rights reserved.
//

import UIKit

class cell1: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var lblLorem: UILabel!
    
    @IBOutlet weak var lblValue: UILabel!
    
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    
    @IBOutlet weak var lblExtrainfo: UILabel!
    var btnAction : (()->())?
    
    @IBOutlet weak var btnImage: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 10
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func btn(_ sender: Any) {
         btnAction?()
    }
    
}
