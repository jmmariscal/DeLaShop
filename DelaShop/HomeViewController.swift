//
//  HomeViewController.swift
//  DelaShop
//
//  Created by Juan M Mariscal on 3/19/18.
//  Copyright © 2018 Juan M Mariscal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        assignBackground()
        setupAppointmentButton()
        
        navigationItem.title = "DeLa Shop"
    }
    
    func assignBackground() {
        let background = UIImage(named: "barbershop")
        
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    fileprivate func setupAppointmentButton() {
        let stackView = UIStackView(arrangedSubviews: [appointmentBtn])
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 450, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 200, height: 75)
    }
    
    let appointmentBtn: UIButton = {
       let appBtn = UIButton(type: .system)
        appBtn.addTarget(self, action: #selector(didTapAppointmentBtn), for: .touchUpInside)
        appBtn.setTitle("Book Appointment", for: .normal)
        appBtn.backgroundColor = .gray
        appBtn.layer.cornerRadius = 5
        
        return appBtn
    }()
    
    @objc func didTapAppointmentBtn() {
        let cutAppHooks = "theCut://"
        let cutAppUrl = NSURL(string: cutAppHooks)
        
        if UIApplication.shared.canOpenURL(cutAppUrl! as URL) {
            UIApplication.shared.open(cutAppUrl! as URL, options: [:], completionHandler: nil)
        } else {
            let cutAppWebUrl = NSURL(string: "https://www.thecut.co/download")
            UIApplication.shared.open(cutAppWebUrl! as URL, options: [:], completionHandler: nil)
        }
    }

}



