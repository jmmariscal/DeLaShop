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
        setupLogoLabel()
        
        navigationItem.title = "Appointments"
    }
    
    
    func assignBackground() {
        let background = UIImage(named: "Haircut")
        
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    private func setupLogoLabel() {
        let logo = logoLabel
        
        view.addSubview(logo)
        logo.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 300, height: 100)
    }
    
    fileprivate func setupAppointmentButton() {
        let stackView = UIStackView(arrangedSubviews: [appointmentBtn])
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 225, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 200, height: 60)
    }
    
    let appointmentBtn: UIButton = {
       let appBtn = UIButton(type: .system)
        appBtn.addTarget(self, action: #selector(didTapAppointmentBtn), for: .touchUpInside)
        appBtn.setTitle("Book Appointment", for: .normal)
        appBtn.setTitleColor(.white, for: .normal)
        appBtn.backgroundColor = .darkGray
        appBtn.layer.cornerRadius = 5
        
        return appBtn
    }()
    
    let logoLabel: UILabel = {
       let logo = UILabel()
        logo.text = "DeLa Shop"
        logo.textColor = .white
        logo.textAlignment = .center
        logo.font = UIFont.boldSystemFont(ofSize: 50)
        
        
        return logo
    }()
    
    @objc func didTapAppointmentBtn() {
        let cutAppHooks = "thecut://"
        let cutAppUrl = NSURL(string: cutAppHooks)
        
        if UIApplication.shared.canOpenURL(cutAppUrl! as URL) {
            UIApplication.shared.open(cutAppUrl! as URL, options: [:], completionHandler: nil)
        } else {
            let cutAppWebUrl = NSURL(string: "https://www.thecut.co/download")
            UIApplication.shared.open(cutAppWebUrl! as URL, options: [:], completionHandler: nil)
        }
    }

}



