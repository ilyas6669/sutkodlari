//
//  SplahView.swift
//  sutkodları
//
//  Created by İlyas Abiyev on 7/19/20.
//  Copyright © 2020 İlyas Abiyev. All rights reserved.
//

import UIKit

class SplahView: UIViewController {
    
    
    //MARK: Properties
    let imgLogo : UIImageView = {
        let img = UIImageView(image: UIImage(named: "logopng"))
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 250).isActive = true
        return img
    }()
    
    var activityIndicator : UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.style = .medium
        indicator.color = .white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    let imgBacgorund : UIImageView = {
        let img = UIImageView(image: UIImage(named: "splashbg"))
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        if CheckInternet.Connection() {
            perform(#selector(toViewController), with: nil,afterDelay: 2)
        }else {
            self.Alert(Message: "Cihazınız internete bağlı değil")
        }
        
        view.addSubview(imgBacgorund)
        view.addSubview(imgLogo)
        view.addSubview(activityIndicator)
        
        _ = imgBacgorund.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        imgLogo.merkezKonumlamdirmaSuperView()
        
        _ = imgLogo.anchor(top: nil, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        activityIndicator.topAnchor.constraint(equalTo: imgLogo.bottomAnchor,constant: 0).isActive = true
        activityIndicator.merkezXSuperView()
        
        
        
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    func Alert (Message: String){
        let alert = UIAlertController(title: "Uyarı", message: Message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Yeniden dene", style: .destructive) { (action) in
            let view = SplahView()
            view.modalPresentationStyle = .fullScreen
            self.present(view, animated: false, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: false, completion: nil)
    }
    
    @objc func toViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

   

}
