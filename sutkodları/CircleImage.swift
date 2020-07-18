//
//  CircleImage.swift
//  SwinApp
//
//  Created by İlyas Abiyev on 7/4/20.
//  Copyright © 2020 İlyas Abiyev. All rights reserved.
//

import UIKit

extension UIImageView {

   func setRounded() {
    let radius = self.frame.width / 2
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
   }
}

extension UIView {

   func setRounded2() {
    let radius = self.frame.width / 2
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
   }
}




extension UIButton {

   func setRoundedButton() {
    let radius = self.frame.width / 2
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
   }
}
